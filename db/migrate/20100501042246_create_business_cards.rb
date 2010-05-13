class CreateBusinessCards < ActiveRecord::Migration
  def self.up
    create_table :business_cards do |t|
      t.belongs_to :contact
      t.string  :card_file_name
      t.string  :card_content_type
      t.integer :card_file_size
      t.datetime :card_updated_at
      t.timestamps
    end
    
    add_index :business_cards, :contact_id
  end

  def self.down
    drop_table :business_cards
  end
end
