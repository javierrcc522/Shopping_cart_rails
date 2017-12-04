require 'rails_helper'

describe Order, "testing associations of" do
  it { should have_many :order_items }
end

describe Order, "testing columns in database " do
  it { should have_db_column(:status).of_type(:string) }
  it { should have_db_column(:total_price).of_type(:decimal) }
  it { should have_db_column(:created_at).of_type(:datetime) }
  it { should have_db_column(:updated_at).of_type(:datetime) }
end
