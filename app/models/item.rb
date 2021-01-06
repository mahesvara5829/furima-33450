class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :status
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :send_fee
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :send_area
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :send_day

  has_one_attached :image
  belongs_to :user

  validates :image,presence: true
  validates :name,presence: true
  validates :discription,presence: true
  validates :category_id,presence: true, numericality: { other_than: 1 }
  validates :status_id,presence: true, numericality: { other_than: 1 }
  validates :send_fee_id,presence: true, numericality: { other_than: 1 }
  validates :send_area_id,presence: true, numericality: { other_than: 1 }
  validates :send_day_id,presence: true, numericality: { other_than: 1 }
  validates :price,presence: true


end


#,in:300..9999999,format:{with:/\A[0-9]+\z/}