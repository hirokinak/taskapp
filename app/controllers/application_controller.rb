class ApplicationController < ActionController::Base
  before_action :basic

  private
  def basic
    authenticate_or_request_with_http_basic do |name, password|
      name == "test" && password == "1111"
    end
  end
end
