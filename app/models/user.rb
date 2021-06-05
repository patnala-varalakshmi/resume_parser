class User < ApplicationRecord
  belongs_to :resume
  has_many :employment_details, dependent: :destroy
  has_many :education_details, dependent: :destroy
end
