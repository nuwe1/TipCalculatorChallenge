# frozen_string_literal: true

module Admin
  class DashboardController < ApplicationController
    def index
      # Fetch all tip calculations and order them by created_at in descending order
      @calculations = TipCalculation.order(created_at: :desc)
    end
  end
end
