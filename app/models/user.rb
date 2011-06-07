class User < ActiveRecord::Base
  attr_accessor :password
  attr_accessible :email, :password, :password_confirmation, :nome, :profissao, :data_de_nascimento, :rg, :endereco, :telefone, :convenios, :nome_do_pai, :nome_da_mae
  
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  validates :email,              :presence => true,
                                 :format => { :with => email_regex },
                                 :uniqueness => { :case_sensitive => false },
                                 :length => { :maximum => 50 }
  validates :password,           :presence => true,
                                 :confirmation => true,
                                 :length => { :within => 6..40 }
  validates :nome,               :presence => true,
                                 :length => { :maximum => 50 }
  validates :profissao,          :presence => true,
                                 :length => { :maximum => 50 }
  validates :data_de_nascimento, :presence => true
  validates :rg,                 :presence => true,
                                 :length => { :maximum => 50 }
  validates :endereco,           :presence => true,
                                 :length => { :maximum => 50 }
  validates :telefone,           :presence => true,
                                 :length => { :maximum => 50 }
  validates :convenios,          :presence => true,
                                 :length => { :maximum => 50 }
  validates :nome_do_pai,        :presence => true,
                                 :length => { :maximum => 50 }
  validates :nome_da_mae,        :presence => true,
                                 :length => { :maximum => 50 }
  
  before_save :encrypt_password
  
  def has_password?(submitted_password)
    encrypted_password == encrypt(submitted_password)
  end
  
  def self.authenticate(email, submitted_password)
    user = find_by_email(email)
    return nil if user.nil?
    return user if user.has_password?(submitted_password)
  end
  
  def self.authenticate(email, submitted_password)
    user = find_by_email(email)
    return nil if user.nil?
    return user if user.has_password?(submitted_password)
  end
  
  def self.authenticate_with_salt(id, cookie_salt)
    user = find_by_id(id)
    (user && user.salt == cookie_salt) ? user : nil
  end
  
  private
    def encrypt_password
      self.salt = make_salt if new_record?
      self.encrypted_password = encrypt(password)
    end
    
    def encrypt (string)
      secure_hash("#{salt}--#{string}")
    end
    
    def make_salt
      secure_hash("#{Time.now.utc}--#{password}")
    end
    
    def secure_hash(string)
      Digest::SHA2.hexdigest(string)
    end
end
