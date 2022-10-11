class BookClubsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    before_action :set_bookclub, only: [:show, :destroy]
    skip_before_action :authorize, only: [:index, :show]

end
