class Api::V1::UsersController < ActionController::Base
	respond_to :json
	def index
		@users = User.includes(posts: :comments)
		@response = {:users=> @users}
		respond_with @response, :include => {posts: {only: [:id, :title], :include=>{comments:{only: [:id,:content]}}}}, :except => [:created_at, :updated_at]
	end
end
