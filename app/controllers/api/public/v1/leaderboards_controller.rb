# frozen_string_literal: true

module Api
  module Public
    module V1
      class LeaderboardsController < ApiController
        def show
          users = ::V1::Leaderboard::ListService.call(country_code: permit_params[:country_code])

          render json: users
        end

        private
          def permit_params
            params.permit(:country_code)
          end
      end
    end
  end
end
