class WaitlistsController < ApplicationController
  before_action :set_waitlist, only: %i[ show edit update destroy ]

  # GET /waitlists or /waitlists.json
  def index
    if(session[:applicant_id] != nil)
      @waitlists = Waitlist.all.where("applicant_id ="+session[:applicant_id].to_s )
    else
    @waitlists = Waitlist.all
    end
  end

  def accept_waitlist

    object = Waitlist.find(params[:request_id])
    object[:status] = "approved"
    object.save

    redirect_to waitlists_url, notice: "Waitlisted Application accepted."
  end

  def reject_waitlist
    application_object = Waitlist.find(params[:request_id])
    application_object[:status] = "rejected"
    application_object.save
    redirect_to waitlists_url, notice: "Application rejected"
  end

  def withdraw_waitlist
    application_object = Waitlist.find(params[:request_id])
    application_object[:status] = "withdraw"
    application_object.save
    redirect_to waitlists_url, notice: "Application withdrawn"
  end

  # GET /waitlists/1 or /waitlists/1.json
  def show
  end

  # GET /waitlists/new
  def new
    @waitlist = Waitlist.new
  end

  # GET /waitlists/1/edit
  def edit
  end


  def create
    @waitlist = Waitlist.new(waitlist_params)

    respond_to do |format|
      if @waitlist.save
        format.html { redirect_to @waitlist, notice: "Waitlist was successfully created." }
        format.json { render :show, status: :created, location: @waitlist }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @waitlist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /waitlists/1 or /waitlists/1.json
  def update
    respond_to do |format|
      if @waitlist.update(waitlist_params)
        format.html { redirect_to @waitlist, notice: "Waitlist was successfully updated." }
        format.json { render :show, status: :ok, location: @waitlist }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @waitlist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /waitlists/1 or /waitlists/1.json
  def destroy
    @waitlist.destroy
    respond_to do |format|
      format.html { redirect_to waitlists_url, notice: "Waitlist was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_waitlist
      @waitlist = Waitlist.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def waitlist_params
      params.require(:waitlist).permit(:applicant_id, :datetime, :property_id, :status)
    end
end
