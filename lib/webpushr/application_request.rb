class Webpushr::ApplicationRequest
  BASE_URL = Settings.webpushr.base_url
  WEBPUSHR_KEY = ENV["WEBPUSHR_KEY"]
  WEBPUSHR_AUTH_TOKEN = ENV["WEBPUSHR_AUTH_TOKEN"]

  # Override by all children classes
  REQUEST_METHOD = ""
  REQUEST_PATH = ""

  # Override by only necessary children classes
  REQUEST_PARAMETERS = []
  REQUIRED_PARAMETERS = []

  attr_reader :response

  def initialize options = {}
    @options = options
    validate_required_parameters
  end

  def perform
    @response = Faraday.send(request_method, request_url) do |req|
      req.headers = request_headers
      req.body = request_body.to_json
    end
  end

  private
  attr_reader :options

  def request_method
    self.class::REQUEST_METHOD
  end

  def request_url
    "#{BASE_URL}/#{self.class::REQUEST_PATH}"
  end

  def request_headers
    {
      "Content-Type" => "application/json",
      "webpushrKey" => WEBPUSHR_KEY,
      "webpushrAuthToken" => WEBPUSHR_AUTH_TOKEN
    }
  end

  def request_body
    request_parameters = self.class::REQUEST_PARAMETERS || []
    options.slice(*request_parameters).compact
  end

  def validate_required_parameters
    required_parameters = self.class::REQUIRED_PARAMETERS || []
    required_parameters.each do |params|
      raise StandardError, "Missing required parameters: #{params}" unless options[params]
    end
  end
end
