class Photo < ActiveRecord::Base
  attr_accessible :avatar , :tag_list
  acts_as_taggable
  belongs_to  :album
  belongs_to  :user

 has_attached_file :avatar, :styles => { :medium => "30x30>", :thumb => "10x10>" }, :default_url => "/images/missing.jpg"
validates_with AttachmentPresenceValidator, :attributes => :avatar
validates_attachment :avatar, :presence => true,
  :content_type => { :content_type => ['image/jpeg', 'image/png', 'image/gif'] }
  validates :avatar, :presence => true
end
