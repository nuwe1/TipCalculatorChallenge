import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["delete"];

  connect() {
    this.deleteTargets.forEach((button) => {
      button.addEventListener("click", this.handleNotificationDismiss.bind(this));
    });
  }

  handleNotificationDismiss(event) {
    this.removeNotification(event);
    this.refreshPage();
  }

  removeNotification(event) {
    const notification = event.target.closest(".notification");
    if (notification) {
      notification.remove();
    }
  }

  refreshPage() {
    setTimeout(() => {
      window.location.reload();
    }, 500);
  }
}
