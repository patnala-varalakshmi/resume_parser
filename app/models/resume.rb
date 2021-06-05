class Resume < ApplicationRecord
 include PromptAPI

 has_one_attached :file
 validates :file, presence: true
 after_create :parse_uploaded_resume
 has_one :user, dependent_destroy: true

 def parse_uploaded_resume
 	response = {
      "education": [
        {
          "dates": [
            "May 2011"
          ],
          "name": "RIVER BROok university"
        }
      ],
      "email": "john@gmail.com",
      "experience": [
        {
          "date_end": "August 2015",
          "date_start": "June 2011",
          "dates": [
            "June 2011",
            "August 2015"
          ],
          "location": "Plano",
          "organization": "VOKO COMMUNICATIONS",
          "title": "Front End Developer"
        },
        {
          "dates": [
            "September 2015"
          ],
          "location": "Camarillo",
          "organization": "DP TECHNOLOGY CORP.",
          "title": "Front End Developer"
        }
      ],
      "name": "JOHN DOE",
      "skills": [
        "Css",
        "Illustrator",
        "Computer science",
        "Wordpress",
        "Photoshop",
        "C",
        "Sql",
        "Programming",
        "Adobe",
        "Benchmark",
        "Json",
        "Design",
        "Javascript",
        "Html",
        "Cms",
        "Html5",
        "Api",
        "Php",
        "C#"
      ]
    }
    create_user_records(response)
 end

 def create_user_records(response)
    user_params = {
        name: response[:name],
        email: response[:email],
        skills: response[:skills],
        phone_number: response[:phone_number],
        resume_id: id
    }
    debugger
    User.create!(user_params)
 end
end
