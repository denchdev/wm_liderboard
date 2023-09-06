# frozen_string_literal: true

module Api
  module Public
    module V1
      class PromtsController < ApiController
        include Pagy::Backend
        def index
          results = ::V1::Promts::SearchService.call(query: permit_params[:query])

          _pagy, @promts = pagy_searchkick(results, items: 25)

          render json: @promts
        end

        private
          def permit_params
            params.permit(:query)
          end
      end
    end
  end
end
