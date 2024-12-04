import { Controller } from "stimulus";

export default class extends Controller {
  static targets = [
    "billAmountInput",
    "tipAmountOutput",
    "totalBillOutput",
    "container",
    "customTipInput" // New target for the hidden custom tip percentage input
  ];

  // Capture the bill amount from the input field
  captureBillAmount(event) {
    // Parse the bill amount, defaulting to 0 if invalid
    const billAmount = parseFloat(event.target.value);
    // Proceed with the calculation if the bill amount is valid
    this.updateCalculations(billAmount);
  }


  // Select the tip percentage and calculate the tip and total bill
  select(event) {
    // Prevent the form from submitting
    event.preventDefault();

    const target = event.currentTarget;
    const hiddenField = document.getElementById("tip_percentage"); // Get the hidden field
    let selectedTipValue;

    // Check if the target is a button or input field
    if (target.tagName === "BUTTON") {
      selectedTipValue = target.getAttribute("data-value");
      hiddenField.value = selectedTipValue; // Set hidden input to selected button's value
    } else if (target.tagName === "INPUT") {
      selectedTipValue = target.value;
      hiddenField.value = selectedTipValue;
    }


    // Highlight selected button/input
    this.highlightSelection(target);

    // If a predefined button (e.g., "5%") is clicked, update the hidden input and calculations
    if (selectedTipValue !== undefined && selectedTipValue !== null) {
      this.updateCalculationsFromTipPercentage(selectedTipValue);
    } else {
      // If it's custom input, do not change the calculation until custom input is captured
      this.updateCalculationsFromTipPercentage(0); // Default custom tip to 0 until the user enters a custom value
    }
  }

  // Calculate the tip and total bill
  updateCalculations(billAmount) {
    const tipPercentage = this.selectedTipPercentage || 0; // Default to 0 if no percentage is selected
    const tipAmount = billAmount * (tipPercentage / 100);
    const totalBill = billAmount + tipAmount;

    // Update the tip and total bill outputs
    this.tipAmountOutputTarget.innerHTML = `&dollar;${tipAmount.toFixed(2) || 0.00}`;
    this.totalBillOutputTarget.innerHTML = `&dollar;${totalBill.toFixed(2) || 0.00}`;
  }

  // Use the selected percentage to calculate the tip and total bill
  updateCalculationsFromTipPercentage(tipPercentage) {
    const billAmount = parseFloat(this.billAmountInputTarget.value) || 0.00;
    this.selectedTipPercentage = parseFloat(tipPercentage);
    this.updateCalculations(billAmount);
  }

  // Highlight the selected button/input
  highlightSelection(selectedElement) {
    // Reset all containers
    this.containerTargets.forEach((container) => {
      const button = container.querySelector("button");
      const input = container.querySelector("input");
      if (button) button.classList.remove("is-selected");
      if (input) input.classList.remove("is-selected");
    });

    // Highlight the selected button or input
    if (selectedElement.tagName === "BUTTON") {
      selectedElement.classList.add("is-selected");
    } else if (selectedElement.tagName === "INPUT") {
      selectedElement.classList.add("is-selected");
    }
  }
}
