class CreateCompanies < ActiveRecord::Migration
  def self.up
    create_table :companies do |t|
      t.string  :name
      t.text    :description
      t.string  :city
      t.string  :state
      t.string  :stock_symbol
      t.string  :logo_file_name
      t.string  :logo_content_type
      t.integer :logo_file_size
      t.datetime :logo_updated_at
      t.timestamps
    end
    
    add_index :companies, :name
    add_index :companies, :stock_symbol
    add_index :companies, :state
    add_index :companies, :city
  end

  def self.down
    drop_table :companies
  end
end
