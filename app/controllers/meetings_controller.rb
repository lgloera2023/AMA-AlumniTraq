# frozen_string_literal: true

class MeetingsController < ApplicationController
  skip_before_action :set_smart_link, only: %i[destroy]
  before_action :set_meeting, only: %i[show edit update destroy]
  before_action :check_event_authority, except: %i[index show]

  # GET /meetings or /meetings.json
  def index
    # Check if valid date
    if params[:start_date]
      begin
        Date.parse(params[:start_date])
      rescue ArgumentError
        respond_to do |format|
          format.html { redirect_to(meetings_url, notice: 'Invalid date.') }
          format.json { head(:no_content) }
        end
      end
    end

    @meetings = Meeting.all
  end

  # GET /meetings/1 or /meetings/1.json
  def show
    @event_attendee = EventAttendee.find_by(user: Current.user, meeting: @meeting)
    Current.previous_path = '/meetings'
  end

  # GET /meetings/new
  def new
    @meeting = Meeting.new
  end

  # GET /meetings/1/edit
  def edit
    Current.previous_path = "/meetings/#{String(@meeting.id)}"
  end

  # POST /meetings or /meetings.json
  def create
    @meeting = Meeting.new(meeting_params)

    respond_to do |format|
      if @meeting.save
        format.html { redirect_to(meeting_url(@meeting), notice: 'Meeting was successfully created.') }
        format.json { render(:show, status: :created, location: @meeting) }
      else
        format.html { render(:new, status: :unprocessable_entity) }
        format.json { render(json: @meeting.errors, status: :unprocessable_entity) }
      end
    end
  end

  # PATCH/PUT /meetings/1 or /meetings/1.json
  def update
    respond_to do |format|
      if @meeting.update(meeting_params)
        format.html { redirect_to(meeting_url(@meeting), notice: 'Meeting was successfully updated.') }
        format.json { render(:show, status: :ok, location: @meeting) }
      else
        format.html { render(:edit, status: :unprocessable_entity) }
        format.json { render(json: @meeting.errors, status: :unprocessable_entity) }
      end
    end
  end

  # DELETE /meetings/1 or /meetings/1.json
  def destroy
    @meeting.destroy!

    respond_to do |format|
      format.html { redirect_to(meetings_url, notice: 'Meeting was successfully destroyed.') }
      format.json { head(:no_content) }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_meeting
    @meeting = Meeting.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def meeting_params
    params.require(:meeting).permit(:name, :start_time, :end_time, :description)
  end

  def check_event_authority
    # Allow admin or event planner to write to calendar
    render_unauthorized if !Current.user.is_admin? && !Current.user.is_event_planner?
  end
end
