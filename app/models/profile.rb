class Profile < ApplicationRecord
  belongs_to :user

  validates :surname, :name, :patronymic, :date_of_birth, presence: true
end
