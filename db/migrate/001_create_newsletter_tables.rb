class CreateNewsletterTables < ActiveRecord::Migration
  
  def self.up
    
    create_table "addresses", :force => true do |t|
      t.string   "email"
      t.string   "name"
      t.boolean  "active",      :default => false
      t.string   "secret"
      t.datetime "created_at"
      t.datetime "modified_at"
    end

    create_table "deliveries", :force => true do |t|
      t.integer  "mailing_id", :limit => 11
      t.integer  "address_id", :limit => 11
      t.datetime "created_at"
    end

    create_table "mailings", :force => true do |t|
      t.integer  "newsletter_id", :limit => 11
      t.datetime "created_at"
      t.integer  "addrcount",     :limit => 11
    end

    create_table "newsletters", :force => true do |t|
      t.text     "body"
      t.datetime "created_at"
      t.datetime "modified_at"
      t.string   "subject"
    end
    
  end

  def self.down
    
    drop_table "addresses"
    drop_table "deliveries"
    drop_table "mailings"
    drop_table "newsletters"
    
  end
  
end
