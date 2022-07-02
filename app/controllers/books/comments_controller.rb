# frozen_string_literal: true

class Books::CommentsController < ApplicationController
  def create
    @book = Book.find(params[:book_id])
  end
end
