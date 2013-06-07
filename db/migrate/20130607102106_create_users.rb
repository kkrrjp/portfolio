class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :userid,:null => false
	  t.string :provider,:null => false
	  t.string :name,:null => false
	  t.string :nickname,:null => false
	  t.string :thumb
	  t.string :explain
	  t.integer :delflg ,:limit =>1 ,:default=>0,:null => false
      t.timestamps
    end
	
	add_index :users , [:userid, :provider], :unique => true, :name=>'uniq_provider'
	add_index :users , [:delflg, :name], :name=>'idx_mix1'
  end
end
