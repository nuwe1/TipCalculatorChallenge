require 'rails_helper'

RSpec.describe "Tips", type: :request do
  describe "GET /index" do
    it "renders the index page successfully" do
      get root_path
      expect(response).to have_http_status(:success)
      expect(response.body).to include("Bill")
    end
  end

  describe "POST /calculate" do
    let(:valid_params) do
      {
        bill_amount: "100.00",
        tip_percentage: "15",
        custom_tip_percentage: "0",
        number_of_people: "4"
      }
    end

    let(:invalid_params) do
      {
        bill_amount: "0",
        tip_percentage: "0",
        custom_tip_percentage: "0",
        number_of_people: "0"
      }
    end

    context "with valid parameters" do
      it "calculates the tip and saves it to the database" do
        expect {
          post calculate_tips_path, params: valid_params
        }.to change(TipCalculation, :count).by(1)

        expect(response).to redirect_to(root_path)
        follow_redirect!
        expect(response.body).to include("Calculation complete and saved successfully!")
      end
    end

  end
end
