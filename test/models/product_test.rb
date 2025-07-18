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
require "test_helper"

class ProductTest < ActiveSupport::TestCase
  include ActionMailer::TestHelper

  test "sends email notifications when back in stock" do
    product = products(:tshirt)

    # Set product out of stock
    product.update(inventory_count: 0)

    assert_emails 2 do
      product.update(inventory_count: 99)
    end
  end
end
