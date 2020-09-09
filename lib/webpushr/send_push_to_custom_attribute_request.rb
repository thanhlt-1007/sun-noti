class Webpushr::SendPushToCustomAttributeRequest < Webpushr::ApplicationRequest
  REQUEST_METHOD = "post"
  REQUEST_PATH = "notification/send/attribute"

  REQUEST_PARAMETERS = %i[title message target_url attribute name icon expire_push auto_hide send_at action_buttons]
  REQUIRED_PARAMETERS = %i[title message target_url attribute]
end
