class CreateEmails < ActiveRecord::Migration
  def self.up
    create_table :emails do |t|
      t.belongs_to :contact
      t.string     :email
      t.string     :email_type
      t.boolean    :primary, :default => false
      t.timestamps
    end
    
    add_index :emails, :contact_id
    add_index :emails, :email
  end

  def self.down
    drop_table :emails
  end
end
