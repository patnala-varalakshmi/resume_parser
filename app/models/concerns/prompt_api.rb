require 'net/http'
require 'uri'

module PromptAPI
  def self.parse_resume(url = "https://assets.promptapi.com/apis/codes/resume_parser/sample_resume.docx")
    url = URI.encode(url)
    url = URI("https://api.promptapi.com/resume_parser/url?url=#{url}")

    https = Net::HTTP.new(url.host, url.port);
    https.use_ssl = true

    request = Net::HTTP::Get.new(url)
    request['apikey'] = ENV['prompt_api_key']

    prompt_api_key = "rSOWuHsnoGcItBrbEBca4SwXhLxRySsj"

    response = https.request(request)

    json_response = JSON response.read_body

    {
      message: response[:message],
      status: response.code,
      data: json_response
    }
  end
end
