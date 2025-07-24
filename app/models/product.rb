# == Schema Information
#
# Table name: products
#
#  id              :integer          not null, primary key
#  inventory_count :integer
#  name            :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class Product < ApplicationRecord
  include Product::Notifications
  has_rich_text :description
  has_one_attached :featured_image
  has_one_attached :specification
  validates :name, presence: true
  validates :inventory_count, numericality: { greater_than_or_equal_to: 0 }
  has_many :product_comments, dependent: :destroy

  scope :with_description_containing, ->(text) {
    joins(:rich_text_description)
      .where("action_text_rich_texts.body LIKE ?", "%#{text}%")
  }
end
