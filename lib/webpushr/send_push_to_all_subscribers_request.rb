class Webpushr::SendPushToAllSubscribersRequest < Webpushr::ApplicationRequest
  REQUEST_METHOD = "post"
  REQUEST_PATH = "notification/send/all"

  REQUEST_PARAMETERS = %i[title message target_url name icon image expire_push auto_hide send_at action_buttons]
  REQUIRED_PARAMETERS = %i[title message target_url]
end
