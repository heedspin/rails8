# == Schema Information
#
# Table name: subscribers
#
#  id         :integer          not null, primary key
#  email      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  product_id :integer          not null
#
# Indexes
#
#  index_subscribers_on_product_id  (product_id)
#
# Foreign Keys
#
#  product_id  (product_id => products.id)
#
class Subscriber < ApplicationRecord
  belongs_to :product
  generates_token_for :unsubscribe
end
