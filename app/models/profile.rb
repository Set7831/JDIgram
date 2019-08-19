class Profile < ApplicationRecord
  belongs_to :user



  attr_accessor :current_password

  validates :surname, :name, :patronymic, :date_of_birth, presence: true


end
