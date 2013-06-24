class Album < ActiveRecord::Base
  attr_accessible :title ,:photos_attributes
  belongs_to :user
  has_many :photos ,:dependent => :destroy
validates :title, :presence => true


  accepts_nested_attributes_for :photos, :allow_destroy => :true
  
end
