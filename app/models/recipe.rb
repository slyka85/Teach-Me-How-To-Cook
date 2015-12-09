class Recipe < ActiveRecord::Base
	extend FriendlyId
  friendly_id :title, use: [:slugged, :finders]
	belongs_to :user
	has_many :ingredients
	has_many :directions

	accepts_nested_attributes_for :ingredients,
  															reject_if: proc { |attributes| attributes['name'].blank? },
  															allow_destroy: true
 	accepts_nested_attributes_for :directions,
  															reject_if: proc { |attributes| attributes['step'].blank? },
  															allow_destroy: true

  validates :title, :description, :image, presence: true

	
	 has_attached_file :image, :styles => { medium: "400x400#" },
	  :url  => ":s3_domain_url",
    :path => "public/avatars/:id/:style_:basename.:extension",
    :storage => :fog,
    :fog_credentials => {
        provider: 'AWS',
        aws_access_key_id: ENV["AWS_ACCESS_KEY_ID"],
        aws_secret_access_key: ENV["AWS_SECRET_ACCESS_KEY"]
    },
    fog_directory: ENV["FOG_DIRECTORY"]



	 validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/


   def self.search(search)
      if search
        where(["title LIKE ?", "%#{search}%"])
      else
        all
      end
   end


end
