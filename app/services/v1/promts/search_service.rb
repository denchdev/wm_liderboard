# frozen_string_literal: true

module V1
  module Promts
    class SearchService < BaseService
      def initialize(query: "*", where: {}, order: {}, load: true, misspellings: false)
        @query = query
        @where = where
        @order = order
        @load = load
        @misspellings = misspellings
      end

      def call
        Promt.pagy_search(@query, where: @where, order: @order, load: @load, misspellings: @misspellings)
      end
    end
  end
end
