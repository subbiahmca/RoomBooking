class BookingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_booking, only: [:show, :edit, :update, :destroy]
  require 'date'

  # GET /bookings
  # GET /bookings.json
  def index
    if params[:user_id]
    @bookings = Booking.where(:user_id => params[:user_id])
    else
    end
  end

  # GET /bookings/1
  # GET /bookings/1.json
  def show
  end

  # GET /bookings/new
  def new
    puts "======================"
    puts params[:room_id]
    puts "======================"

    @room = Room.find(params[:room_id])

    @booking = @room.bookings.new
  end

  # GET /bookings/1/edit
  def edit
  end

  # POST /bookings
  # POST /bookings.json
  def create
    puts "-------------------"
    puts current_user.id
    puts params['booking']['room_id']
    @room_id = params['booking']['room_id']
    @room_id = current_user.id
    @sdate = "#{params['booking']['sdate(1i)']}-#{params['booking']['sdate(2i)']}-#{params['booking']['sdate(3i)']} #{params['booking']['sdate(4i)']}:#{params['booking']['sdate(5i)']}"
    @sdatetime = DateTime.parse(@sdate)
    @data = Booking.where('sdate <= ? AND enddate >= ?  AND room_id == ?', @sdatetime,  @sdatetime, @room_id)
    puts @data.inspect
    puts @sdatetime
    puts "-------------------"
    
    if @data.empty?
      @booking = Booking.new(booking_params)
      respond_to do |format|
        if @booking.save
          format.html { redirect_to bookings_path(:user_id => current_user), notice: 'Booking was successfully created.' }
          format.json { render :show, status: :created, location: @booking }
        else
          format.html { render :new }
          format.json { render json: @booking.errors, status: :unprocessable_entity }
        end
      end      
    else
       redirect_to new_booking_path(:room_id => params['booking']['room_id']), :flash => { :notice => "Please select another time slot" }     
    end
    
  end

  # PATCH/PUT /bookings/1
  # PATCH/PUT /bookings/1.json
  def update
    respond_to do |format|
      if @booking.update(booking_params)
        format.html { redirect_to @booking, notice: 'Booking was successfully updated.' }
        format.json { render :show, status: :ok, location: @booking }
      else
        format.html { render :edit }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bookings/1
  # DELETE /bookings/1.json
  def destroy
    @booking.destroy
    respond_to do |format|
      format.html { redirect_to bookings_path(:user_id => current_user), notice: 'Booking was successfully canceled.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_booking
    @booking = Booking.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def booking_params
    params.require(:booking).permit(:sdate, :enddate, :room_id, :user_id)
  end
end
