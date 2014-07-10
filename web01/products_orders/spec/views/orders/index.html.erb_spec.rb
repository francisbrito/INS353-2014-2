require 'rails_helper'

RSpec.describe "orders/index", :type => :view do
  before(:each) do
    assign(:orders, [
      Order.create!(
        :customer_name => "Customer Name"
      ),
      Order.create!(
        :customer_name => "Customer Name"
      )
    ])
  end

  it "renders a list of orders" do
    render
    assert_select "tr>td", :text => "Customer Name".to_s, :count => 2
  end
end
