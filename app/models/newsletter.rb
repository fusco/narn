class Newsletter < ActiveRecord::Base
  has_many :mailings
  
  def send_email
    system(RAILS_ROOT + "/script/mailing.rb #{RAILS_ENV} #{id} &")
  end
end

