require 'rails_helper'

describe Product, "testing validations of " do
  it { should validate_presence_of :price }
  it { should validate_presence_of :name }
end

describe Product, "testing association of " do
  it { should have_many :order_items }
end

describe Product, "testing columns in database" do
  it { should have_db_column(:price).of_type(:decimal) }
  it { should have_db_column(:name).of_type(:string) }
  it { should have_db_column(:created_at).of_type(:datetime) }
  it { should have_db_column(:updated_at).of_type(:datetime) }
end
