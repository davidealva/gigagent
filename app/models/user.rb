class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates_uniqueness_of :profile_name, :email

  validates_presence_of :first_name, :last_name, :profile_name, :email

  has_many :events

  before_save :create_permalink

  def to_param
     permalink
  end

  private

  def create_permalink
    self.permalink = profile_name.downcase
  end

end
