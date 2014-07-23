require "net/http"
require "uri"

module Githug
  class Notification
    def initialize(options)
      @success = options[:success]
      @level   = options[:level]
    end

    def deliver
      uri = URI.parse(endpoint)
      data = {
        "user_email" => user_email,
        "user_name" => user_name,
        "success" => @success,
        "level_name" => @level.level_name
      }
      response = Net::HTTP.post_form(uri, data)
    end

    def user_name
      `git config --global user.name`.strip
    end

    def user_email
      `git config --global user.email`.strip
    end

    def endpoint
      ENV["GITHUG_NOTIFY_URL"] or raise "Please set GITHUG_NOTIFY_URL env variable."
    end
  end
end
