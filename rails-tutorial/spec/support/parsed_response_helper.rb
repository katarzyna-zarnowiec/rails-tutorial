module ParsedResponseHelper
  def parsed_response
    JSON.parse(response.body)
  end
end

RSpec.configure do |config|
  config.include ParsedResponseHelper, type: :controller
end
