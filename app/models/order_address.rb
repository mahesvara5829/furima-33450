class OrderAddress
  include ActiveModel::Model
  attr_accessor :post_cord, :send_area_id, :city, :address_detail, :apart_name_num, :phone_number, :user_id, :item_id

  with_options presence: true do
    validates :post_cord, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :send_area_id, numericality: { other_than: 1}
    validates :city
    validates :address_detail
    validates :phone_number, format: { with: /\A\d{11}\z/ , message: "within 11 digits"}
    validates :user_id
    validates :item_id
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    #orderはここで作ってあげる
    Address.create(post_cord: post_cord, send_area_id: send_area_id, city: city, address_detail:address_detail, phone_number:phone_number, order_id:order.id)  
  end
end 