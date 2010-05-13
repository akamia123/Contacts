class CreateContacts < ActiveRecord::Migration
  def self.up
    create_table :contacts do |t|
      t.belongs_to :user
      t.belongs_to :company
      t.string  :first_name
      t.string  :last_name
      t.string  :mi
      t.string  :nickname
      t.string  :job_title
      t.text    :notes
      t.string  :picture_file_name
      t.string  :picture_content_type
      t.integer :picture_file_size
      t.datetime :picture_updated_at
      t.boolean :public, :default => false
      t.timestamps
    end
    
    add_index :contacts, :user_id
    add_index :contacts, :company_id
    add_index :contacts, [:last_name, :first_name]
  end

  def self.down
    drop_table :contacts
  end
end
