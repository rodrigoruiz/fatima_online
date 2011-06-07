# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

user = User.create({ :email => "admin@admin.com", :password => "admin0709", :password_confirmation => "admin0709", :nome => "Admin", :profissao => "Admin", :data_de_nascimento => "Admin", :rg => "Admin", :endereco => "Admin", :telefone => "Admin", :convenios => "Admin", :nome_do_pai => "Admin", :nome_da_mae => "Admin" })
user.toggle!(:admin)
