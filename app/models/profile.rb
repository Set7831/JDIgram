class Profile < ApplicationRecord
  belongs_to :user
  attr_accessor :surname, :name, :patronymic, :date_of_birth
end
