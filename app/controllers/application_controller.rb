class ApplicationController < ActionController::API
  handle_api_errors(format: :json_api, backtrace: true)

  def validate_location(data)
    @location = data[:location]
  end
end
