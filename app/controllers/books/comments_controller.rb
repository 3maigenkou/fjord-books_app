# frozen_string_literal: true

class Books::CommentsController < ApplicationController
  before_action :set_book, only: %i[create destroy]

  def create
    @comment = @book.comments.create(comment_params)
    @comment.user = current_user
    @comment.save!
    redirect_to @book
  end

  def destroy
    @comment = current_user.comments.find(params[:id])
    @comment.destroy
    redirect_to @book
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end

  def set_book
    @book = Book.find(params[:book_id])
  end
end
