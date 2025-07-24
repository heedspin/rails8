# == Schema Information
#
# Table name: product_comments
#
#  id          :integer          not null, primary key
#  author_name :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  product_id  :integer          not null
#
# Indexes
#
#  index_product_comments_on_product_id  (product_id)
#
# Foreign Keys
#
#  product_id  (product_id => products.id)
#
class ProductComment < ApplicationRecord
  has_rich_text :content
  belongs_to :product, optional: false
  validates :author_name, presence: true
end
