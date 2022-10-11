class UsersController < ApplicationController

   skip_before_action :authorize, only: :create

   def create
    user = User.create(user_params)

    if user.valid?
        session[:user_id] = user.id
        render json: user, status: :created
    else
        render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
   end

   def show
    user = @current_user
    render json: user, include: ['bookclubs', 'bookclubs.users', 'bookclubs.bookclub_books', 'bookclubs.bookclub_books.book', 'bookclubs.bookclub_books.goals', 'bookclubs.bookclub_books.guide_questions', 'bookclubs.bookclub_books.guide_questions.comments']
    # render json: user
   end

    
end
