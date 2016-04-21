class Restaurant < ActiveRecord::Base
	
	has_many :critics
	has_many :votes
end
