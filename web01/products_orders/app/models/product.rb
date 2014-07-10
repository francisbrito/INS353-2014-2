class Product < ActiveRecord::Base
  validates_presence_of  :name

  belongs_to :order

  def order_name
    order.customer_name
  end

  def full_display
    "Producto: #{name} de precio #{price} y dice #{description}"
  end

end
