class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :email
      t.string :nome
      t.string :profissao
      t.string :data_de_nascimento
      t.string :rg
      t.string :endereco
      t.string :telefone
      t.string :convenios
      t.string :nome_do_pai
      t.string :nome_da_mae

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
