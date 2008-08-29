class DeliveriesController < ApplicationController
  
  def index
    @mailings = Mailing.find(:all, :order => 'created_at desc')
  end
  
end