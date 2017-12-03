require 'rails_helper'

describe OrderItem, "testing validation of " do
  it { should validate_presence_of :quantity }
end

describe OrderItem, "testing associations of " do
  it { should belong_to :product }
  it { should belong_to :order }
end

describe OrderItem, "testing columns of " do
  it { should have_db_column(:quantity).of_type(:integer) }
  it { should have_db_column(:product_id).of_type(:integer) }
  it { should have_db_column(:order_id).of_type(:integer) }
end
