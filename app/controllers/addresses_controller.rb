class AddressesController < ApplicationController
  
  def create
    @addresses = Address.find_or_create_by_email(params[:address])
    #@addresses.update_attributes(:address)
    @addresses.send_activation unless @addresses.active?
  end
  
  def destroy
    @addresses = Address.find_by_email_and_secret(params[:email], params[:secret])
    @addresses.deactivate unless @addresses.nil?
  end
  
  def confirm
    @addresses = Address.find_by_email_and_secret(params[:email], params[:secret])
    @addresses.activate unless @addresses.nil?
  end
  
  def show
    @addresses = Address.paginate :page => params[:page], :per_page => 20
  end
  
end
