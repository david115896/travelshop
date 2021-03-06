class Activity < ApplicationRecord

    validates :title, presence: true, length: {in: 5..140}
    validates :description, presence: true, length: {in: 20..1000}
    validates :price, presence: true
    validates :image_url, presence: true, uniqueness: true
    
    has_many :carts
    has_many :users, through: :carts
    has_many :sold_items

		has_one_attached :illustration

    def self.import(file)
        CSV.foreach(file.path, headers: true) do |row|
            Activity.create! row.to_hash
        end
    end
end
