class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category,:status,:send_fee,:send_area,:send_day


  has_one_attached :image
  belongs_to :user


  with_options presence: true do
    validates :image
    validates :name
    validates :discription
    validates :category_id,:status_id,:send_fee_id,:send_area_id,:send_day_id, numericality: { other_than: 1 }
    validates :price, numericality: {greater_than_or_equal_to: 300,less_than_or_equal_to: 9999999}
  end




end


