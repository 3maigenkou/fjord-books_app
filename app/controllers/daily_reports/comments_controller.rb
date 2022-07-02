# frozen_string_literal: true

class DailyReports::CommentsController < ApplicationController
  def create
    @daily_report = DailyReport.find(params[:daily_report_id])
    @comment = @daily_report.comments.create(comment_params)
    @comment.user = current_user
    @comment.save!
    redirect_to @daily_report
  end


  private
    def comment_params
      params.require(:comment).permit(:comment)
    end
end
