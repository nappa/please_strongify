class CategoryOwnerValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if !record.category_id.blank? &&
        Category.where('user_id = ?', record.user_id).find(record.category_id).nil?
      record.errors[attribute] << 'bad category'
    end
  end
end

class Item < ActiveRecord::Base

  belongs_to :user
  belongs_to :category

  scope :by_user, lambda { |user|
    where('user_id = ?', user.id)
  }

  validates :category,
            :presence => true,
            :associated => true,
            :category_owner => true

  validates :user,
            :presence => true

  validates :title,
            :presence => true,
            :length => { :in => 1..2000 }

  validates :title,
            :presence => true,
            :length => { :in => 1..100 }

  attr_accessible :category_id, :text, :title
end
