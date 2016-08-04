require "json"
require "rest-client"
require "inpost_api/version"
require "inpost_api/configuration"
require "inpost_api/cache"
require "inpost_api/client"
require "inpost_api/helper"

module InpostApi

  extend Cache
  extend Client

  class << self

    def configure
      yield(configuration) if block_given?
    end

    def configuration
      @configuration ||= Configuration.new
    end
  end
end
