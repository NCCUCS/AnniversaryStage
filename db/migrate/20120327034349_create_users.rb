class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :access_token
      t.string :name
      t.string :email
      t.integer :fid, :limit => 8
      t.timestamps
    end
    
    add_index :users, :fid
    add_index :users, :access_token
  end
end