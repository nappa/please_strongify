class Category < ActiveRecord::Base
  has_many   :items
  belongs_to :user

  scope :by_user, lambda { |user|
    where('user_id  = ?', user.id)
  }

  validates :name, :presence => true,
                   :length => { :in => 1..255 }

  validates :user, :presence => true

  attr_accessible :name

  before_destroy :validate_item_exists

  def self.create_default_category_for_user!(user)
    category = self.new(name: 'default')
    category.user = user
    category.save(validate: false)
  end

  private

  def validate_item_exists
    if self.items.any?
      errors.add(:base, "Cannot delete category")
      return false
    end
  end
end
