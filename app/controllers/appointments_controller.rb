class AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:show, :edit, :update, :destroy]

  # GET /appointments
  # GET /appointments.json
  def index
    @appointments = Appointment.all
  end

  # GET /appointments/1
  # GET /appointments/1.json
  def show
  end

  # GET /appointments/new
  def new
    @appointment = Appointment.new
  end

  # GET /appointments/1/edit
  def edit
    @customer = @appointment.customer
    @pet = @appointment.pet
  end

  # POST /appointments
  # POST /appointments.json
  def create
    ActiveRecord::Base.transaction do
      @appointment = Appointment.new(appointment_params)
      customer = User.new
      customer.name = params["customer"]["name"]
      customer.email = params["customer"]["email"]
      customer.password = params["customer"]["password"]
      customer.password_confirmation = params["customer"]["confirm_password"]
      customer.save!
      @appointment.customer = customer
      pet = Pet.new
      pet.name_of_pet = params["pet"]["name_of_pet"]
      pet.type_of_pet = params["pet"]["type_of_pet"]
      pet.breed = params["pet"]["breed"]
      pet.age = params["pet"]["age"]
      pet.weight = params["pet"]["weight"]
      pet.customer = customer
      pet.save!
      @appointment.pet = pet
      respond_to do |format|
        if @appointment.save
          format.html { redirect_to appointments_url, notice: 'Appointment was successfully created.' }
          format.json { render :show, status: :created, location: @appointment }
        else
          format.html { render :new }
          format.json { render json: @appointment.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /appointments/1
  # PATCH/PUT /appointments/1.json
  def update
    respond_to do |format|
      if @appointment.update(appointment_params)
        format.html { redirect_to appointments_url, notice: 'Appointment was successfully updated.' }
        format.json { render :show, status: :ok, location: @appointment }
      else
        format.html { render :edit }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /appointments/1
  # DELETE /appointments/1.json
  def destroy
    @appointment.destroy
    respond_to do |format|
      format.html { redirect_to appointments_url, notice: 'Appointment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_appointment
      @appointment = Appointment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def appointment_params
      params.require(:appointment).permit(:date_of_visit, :pet_id, :user_id, :reminder_of_appointment, :reason_for_visit)
    end
end
