require 'rails_helper'

RSpec.describe "orders/show", :type => :view do
  before(:each) do
    @order = assign(:order, Order.create!(
      :customer_name => "Customer Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Customer Name/)
  end
end
