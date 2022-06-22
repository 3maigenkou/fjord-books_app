# frozen_string_literal: true

class DailyReportsController < ApplicationController
  before_action :set_daily_report, only: %i[ show edit update destroy ]

  # GET /daily_reports or /daily_reports.json
  def index
    @daily_reports = DailyReport.order(:id).page(params[:page])
  end

  # GET /daily_reports/1 or /daily_reports/1.json
  def show
  end

  # GET /daily_reports/new
  def new
    @daily_report = DailyReport.new
  end

  # GET /daily_reports/1/edit
  def edit
  end

  # POST /daily_reports or /daily_reports.json
  def create
    @daily_report = DailyReport.new(daily_report_params)
    @daily_report.user_id = current_user.id

    respond_to do |format|
      if @daily_report.save
        format.html { redirect_to @daily_report, notice: "Daily report was successfully created." }
        format.json { render :show, status: :created, location: @daily_report }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @daily_report.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /daily_reports/1 or /daily_reports/1.json
  def update
    respond_to do |format|
      if @daily_report.update(daily_report_params)
        format.html { redirect_to @daily_report, notice: "Daily report was successfully updated." }
        format.json { render :show, status: :ok, location: @daily_report }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @daily_report.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /daily_reports/1 or /daily_reports/1.json
  def destroy
    @daily_report.destroy
    respond_to do |format|
      format.html { redirect_to daily_reports_url, notice: "Daily report was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_daily_report
      @daily_report = DailyReport.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def daily_report_params
      params.require(:daily_report).permit(:title, :content)
    end
end
