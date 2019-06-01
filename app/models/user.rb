class User < ApplicationRecord
    
  has_many :created_notes, class_name: 'Note'
  has_many :created_alerts, class_name: 'Alert'
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :timeoutable
         
  attr_accessor :login
  
  def login=(login)
      @login = login
  end
  
  validates :name,
  presence: true,
  uniqueness: { case_sensitive:false }
  
  validates_format_of :name, with: /^[a-zA-Z0-9_¥.]*$/, multiline: true
  validate :validate_name
  
  def validate_name
      error.add(:name, :invalid) if User.where(email: name).exists?
  end
  
  def login
      @login || self.name || self.email
  end
  
  def self.find_for_database_authentication(warden_conditions)
   conditions = warden_conditions.dup
   
   conditions[:email].dawncase! if conditions[:email]
   login = conditions.delete(:login)
   
   where(conditions.to_hash).where(
   ["lower(name) = :value OR lower(email) = :value",
   { value: login.downcase }]
   ).first
  end

end
