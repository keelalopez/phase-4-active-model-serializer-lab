class AuthorsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

  def index
    authors = Author.all 
    render json: authors, include: ['profile', 'posts', 'posts.posts_tags']
    # include: ['posts', 'posts.posts_tags']
  end

  def show
    author = Author.find(params[:id])
    render json: author, include: ['profile', 'posts', 'posts.posts_tags']
  end

  private

  def render_not_found_response
    render json: { error: "Author not found" }, status: :not_found
  end

end
