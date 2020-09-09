class Webpushr::SendPushToSingleSubscriberRequest < Webpushr::ApplicationRequest
  REQUEST_METHOD = "post"
  REQUEST_PATH = "notification/send/sid"

  REQUEST_PARAMETERS = %i[title message target_url sid icon expire_push auto_hide send_at action_buttons]
  REQUIRED_PARAMETERS = %i[title message target_url sid]
end
