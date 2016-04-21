class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :restaurant

  def Vote.vote(value, user, restaurant) 

	  vote = Vote.where(:user_id => user.id , :restaurant_id => restaurant.id ).first || Vote.new(:user_id => user.id , :restaurant_id => restaurant.id)

	  if value == "for"
	    vote_value = 1
	  elsif value == "against"
	    vote_value = -1
	  end

	  if vote.value != vote_value
	    vote.value = vote_value
	    vote.save
	else
		vote.value = 0
		vote.save
	  end
	  return vote
	end
end
