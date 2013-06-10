class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name,:null => false
      t.string :email,:null => false
      t.string :password,:null => false
      t.string :nickname,:null => false
      t.string :thumb
      t.text :explain
      t.integer :delflg ,:limit =>1 ,:default=>0,:null => false
      t.timestamps
    end
    add_index :users , [:delflg, :name], :name=>'idx_mix1'
    add_index :users , [:delflg, :email, :password], :name=>'idx_mix2'
  end
end
