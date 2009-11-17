class User < ActiveRecord::Base
  before_create :create_password
  
  validates_inclusion_of :gender, :in => %w( m f )
  validates_presence_of  :first_name
  validates_presence_of  :last_name
  validates_presence_of  :email
  
  has_many :travels, :dependent => :destroy
  
  has_attached_file :avatar, :styles => { :medium => "310x310#", :thumb => "70x70#" }
  
  acts_as_authentic do |c|
    c.validate_password_field = false
    c.require_password_confirmation = false
  end
  
  def to_s
    "#{academic_title} #{first_name} #{last_name}".strip
  end
  
private
  
  def create_password
    self.password = 'abc123'
  end
  
end
