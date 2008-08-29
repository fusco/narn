class Mailing < ActiveRecord::Base
  belongs_to :newsletter
  has_many :deliveries

  def delivered
    self.deliveries.length
  end

end
