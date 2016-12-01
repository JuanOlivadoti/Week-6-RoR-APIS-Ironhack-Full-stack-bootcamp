class PlayersController < ApplicationController
	has_many :player_matches
	has_many :matches, through: :player_matches
end
