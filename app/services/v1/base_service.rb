# frozen_string_literal: true

module V1
  class BaseService
    def self.call(**args)
      new(**args).call
    end
  end
end
