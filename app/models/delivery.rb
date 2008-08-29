class Delivery < ActiveRecord::Base
  belongs_to :address
  belongs_to :mailing
end
