class Webpushr::ApplicationRequest
  BASE_URL = Settings.webpushr.base_url
  WEBPUSHR_KEY = ENV["WEBPUSHR_KEY"]
  WEBPUSHR_AUTH_TOKEN = ENV["WEBPUSHR_AUTH_TOKEN"]

  # Override by children classes
  REQUEST_METHOD = ""
  REQUEST_PATH = ""

  attr_reader :response

  def perform
    @response = Faraday.send(request_method, request_url) do |req|
      req.headers = request_headers
    end
  end

  private

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
end
