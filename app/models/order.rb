class Order < ActiveRecord::Base
  belongs_to :user
  has_many :placements
  has_many :products, through: :placements

  before_validation :set_total!

  validates :total, presence: true,
                     numericality: { greater_than_or_equal_to: 0 }
  validates :user_id, presence: true

  def set_total!
    self.total = products.map(&:price).sum
  end
end
