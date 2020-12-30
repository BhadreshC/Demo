class CommentsController < ApplicationController
	def index
		@comments = Comment.all
		puts @comments.as_json
	end
end
