class User < ActiveRecord::Base

  has_many :items
  has_many :categories

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :lockable, :timeoutable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body

  after_create :create_default_category

  private

  def create_default_category
    Category.create_default_category_for_user!(self)
  end
end
