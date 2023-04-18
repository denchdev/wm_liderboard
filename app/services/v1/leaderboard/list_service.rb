# frozen_string_literal: true

module V1
  module Leaderboard
    class ListService < BaseService
      LEADERBOARD_SIZE = 100

      attr_accessor :country_code, :dir, :main_scope, :points_from, :points_to

      def initialize(country_code: nil, points_from: nil, points_to: nil, dir: :desc)
        @country_code = country_code
        @dir = dir
        @points_from = points_from
        @points_to = points_to
      end

      def call
        @main_scope = User.all
        order
        filter
        main_scope.first(LEADERBOARD_SIZE)
      end

      private
        def order
          @main_scope = main_scope.order(points: dir, id: :asc)
        end

        def filter
          @main_scope = main_scope.where(country_code:) if country_code
          @main_scope = main_scope.where(points_from: points_from..) if points_from
          @main_scope = main_scope.where(points_to: ..points_to) if points_to
        end
    end
  end
end
