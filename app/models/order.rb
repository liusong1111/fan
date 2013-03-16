class Order < ActiveRecord::Base
  attr_accessible :description, :name, :status
  has_many :order_items

  def self.current
    order_name = Time.new.strftime('%Y-%m-%d')
    order = Order.where(name: order_name).first
    if order.blank?
      order = Order.create(name: order_name, status: 'ready')
    end

    order
  end
end
