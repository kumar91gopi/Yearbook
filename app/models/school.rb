class School < ActiveRecord::Base
    has_many :profiles
    
    def self.search(query)
        where("school_name like ?", "%#{query}%") 
    end
end
