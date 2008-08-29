class Address < ActiveRecord::Base
  has_many :deliveries

  validates_uniqueness_of :email
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create
  validates_length_of :email, :minimum => 4

  def Address.all_active()
    return self.find(:all, :conditions => 'active = true')
  end
  
  def activate
    update_attribute(:active, true)
  end
  
  def deactivate
    update_attribute(:active, false)
  end
  
  def create_secret
    update_attribute(:secret, Digest::SHA1.hexdigest("--#{created_at}--#{email}--"))
  end
  
  def active?
    active == true
  end
  
  def send_activation
    create_secret
    Sender.deliver_signup(self)
  end

end
