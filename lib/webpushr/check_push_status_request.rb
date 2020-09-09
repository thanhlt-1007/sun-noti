class Webpushr::CheckPushStatusRequest < Webpushr::ApplicationRequest
  REQUEST_METHOD = "get"
  REQUEST_PATH = "notification/status/id"

  REQUIRED_PARAMETERS = %i[id]


  private
  def request_url
    "#{BASE_URL}/#{self.class::REQUEST_PATH}/#{options[:id]}"
  end
end
