class User < ApplicationRecord

  has_one :profile, dependent: :destroy

  has_many :posts, dependent: :destroy

  accepts_nested_attributes_for :profile #, :allow_destroy => true

  attr_writer :login
  attr_accessor :current_password

  mount_uploader :image, AvatarUploader

  def login
    @login || self.username || self.email
  end


  devise :database_authenticatable, :registerable,
         :recoverable, :confirmable, :rememberable, :trackable, :validatable

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_h).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    elsif conditions.has_key?(:username) || conditions.has_key?(:email)
      where(conditions.to_h).first
    end
  end

  def self.already_liked?(user, post)
    Like.where('user_id = ? AND post_id = ?', user, post)
  end

  validates :username, presence: :true, uniqueness: { case_sensitive: false }
  validates_format_of :username, with: /^[a-zA-Z0-9_\.]*$/, :multiline => true

end
