require 'net/http'
require 'uri'

module PromptAPI
  def self.parse_resume(url = 'public/akhil_resume.docx')
    url = URI("https://api.promptapi.com/resume_parser/url?url=#{url}")

    https = Net::HTTP.new(url.host, url.port);
    https.use_ssl = true

    request = Net::HTTP::Get.new(url)
    request['apikey'] = "6Bh67DoG8T7CMeFgwtt5RyMyRccPTSD9"

    response = https.request(request)
    response.read_body
  end
end
