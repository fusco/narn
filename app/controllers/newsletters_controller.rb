class NewslettersController < ApplicationController
  
  def index
    @newsletters = Newsletter.paginate :page => params[:page], :per_page => 5
  end
  
  def create
    @newsletter = Newsletter.new(params[:newsletter])
    if(request.post? and @newsletter.save)
      @newsletter.send_email
      redirect_to :action => 'show', :id => @newsletter.id
    end
  end
  
  def update
    @newsletter = Newsletter.find_or_create_by_id(params[:id])
    @newsletter.update_attributes(params[:newsletter])
    if(request.post?)
      @newsletter.send_email
      redirect_to :action => 'show', :id => @newsletter.id
    end
  end
  
  def show
    @newsletter = Newsletter.find(params[:id])
  end
  
end
