class Document < ApplicationRecord
  belongs_to :user
  
  mount_uploader :attachment, AttachmentUploader # Tells rails to use this uploader for this model.
  validates :name, :attachment, presence: true 

end
