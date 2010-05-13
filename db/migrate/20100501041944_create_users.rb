class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string  :first_name
      t.string  :last_name
      t.string  :mi
      t.string  :email
      t.string  :hashed_password
      t.string  :salt
      t.timestamps
    end
    
    add_index :users, :email
  end

  def self.down
    drop_table :users
  end
end
