# frozen_string_literal: true

class DailyReports::CommentsController < ApplicationController
  before_action :set_daily_report, only: %i[create destroy]

  def create
    @comment = @daily_report.comments.create(comment_params)
    @comment.user = current_user
    @comment.save!
    redirect_to @daily_report
  end

  def destroy
    @comment = @daily_report.comments.find(params[:id])
    @comment.destroy if @comment.user == current_user
    redirect_to @daily_report
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end

  def set_daily_report
    @daily_report = DailyReport.find(params[:daily_report_id])
  end
end
