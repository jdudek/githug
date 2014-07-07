require "net/http"
require "uri"

module Githug
  class Notification
    def initialize(options)
      @success = options[:success]
    end

    def deliver
      uri = URI.parse("http://requestb.in/ycqm45yc")
      response = Net::HTTP.post_form(uri, { "email" => "me@example.com", "success" => @success })
    end
  end
end
