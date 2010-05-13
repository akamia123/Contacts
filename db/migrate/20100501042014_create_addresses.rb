class CreateAddresses < ActiveRecord::Migration
  def self.up
    create_table :addresses do |t|
      t.belongs_to :contact
      t.string  :address1
      t.string  :address2
      t.string  :city
      t.string  :state
      t.string  :zip_code
      t.string  :address_type
      t.boolean :primary, :default => false
      t.timestamps
    end
    
    add_index :addresses, :contact_id
    add_index :addresses, :zip_code
    add_index :addresses, :state
    add_index :addresses, :city
  end

  def self.down
    drop_table :addresses
  end
end
