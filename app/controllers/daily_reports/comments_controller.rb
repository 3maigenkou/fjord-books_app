# frozen_string_literal: true

class DailyReports::CommentsController < ApplicationController
  def create
    @daily_report = DailyReport.find(params[:book_id])
  end
end
