class Resume < ApplicationRecord
 include PromptAPI

 has_one :user, dependent: :destroy
 has_one_attached :file
 validates :file, presence: true

 after_create :parse_uploaded_resume

 def parse_uploaded_resume
    return unless file.attached?

    file_path = Rails.application.routes.url_helpers.url_for(file)
 	  response = PromptAPI.parse_resume(file_path)
    if response[:status] == "200"
      create_related_records(response)
    else
      errors.add(:internal_error, "unable to create user.")
    end
 end

 def file_name
  file.blob.filename
 end

 def create_related_records(response)
    user_params = {
        name: response[:name],
        email: response[:email],
        skills: response[:skills],
        phone_number: response[:phone_number],
        resume_id: id
    }
    user = User.create!(user_params)

    response['experience'].each do |employment|
      user.employment_details.create!(employment)
    end

    response['education'].each do |education|
      user.education_details.create!(education)
    end
 end
end
