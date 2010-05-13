class CreateTelephones < ActiveRecord::Migration
  def self.up
    create_table :telephones do |t|
      t.belongs_to :contact
      t.string  :number
      t.string  :phone_type
      t.boolean :primary, :default => false
      t.timestamps
    end
    add_index :telephones, :contact_id
    add_index :telephones, :number
  end

  def self.down
    drop_table :telephones
  end
end
