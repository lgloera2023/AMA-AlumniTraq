# frozen_string_literal: true

class MediaHandlesController < ApplicationController
  before_action :set_media_handle, only: %i[show edit update destroy]
  before_action :check_media_handle_authority

  # GET /media_handles or /media_handles.json
  def index
    @media_handles = if Current.user.is_admin?
                       MediaHandle.all
                     else
                       MediaHandle.where(alumnus: Current.user.alumnus)
                     end
    Current.previous_path = '/settings'
  end

  # GET /media_handles/1 or /media_handles/1.json
  def show
    Current.previous_path = '/media_handles'
  end

  # GET /media_handles/new
  def new
    @media_handle = MediaHandle.new
    Current.previous_path = '/media_handles'
  end

  # GET /media_handles/1/edit
  def edit
    Current.previous_path = "/media_handles/#{String(@media_handle.id)}"
  end

  # POST /media_handles or /media_handles.json
  def create
    @media_handle = MediaHandle.new(media_handle_params)

    respond_to do |format|
      if @media_handle.save
        format.html { redirect_to(media_handle_url(@media_handle), notice: 'Media handle was successfully created.') }
        format.json { render(:show, status: :created, location: @media_handle) }
      else
        format.html { render(:new, status: :unprocessable_entity) }
        format.json { render(json: @media_handle.errors, status: :unprocessable_entity) }
      end
    end
  end

  # PATCH/PUT /media_handles/1 or /media_handles/1.json
  def update
    respond_to do |format|
      if @media_handle.update(media_handle_params)
        format.html { redirect_to(media_handle_url(@media_handle), notice: 'Media handle was successfully updated.') }
        format.json { render(:show, status: :ok, location: @media_handle) }
      else
        format.html { render(:edit, status: :unprocessable_entity) }
        format.json { render(json: @media_handle.errors, status: :unprocessable_entity) }
      end
    end
  end

  # DELETE /media_handles/1 or /media_handles/1.json
  def destroy
    @media_handle.destroy!

    respond_to do |format|
      format.html { redirect_to(media_handles_url, notice: 'Media handle was successfully destroyed.') }
      format.json { head(:no_content) }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_media_handle
    @media_handle = MediaHandle.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def media_handle_params
    params.require(:media_handle).permit(:alumnus_id, :platform, :link)
  end

  def check_media_handle_authority
    render_unauthorized if !Current.user.is_admin? && !Current.user.is_alumnus?
  end
end
