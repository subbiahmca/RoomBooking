class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  
   def authenticate_user!    
    if user_signed_in?    
      puts "_____________________"
      puts user_session.inspect
      puts "_____________________"  
      super
    else
      redirect_to new_user_session_path, :notice => 'if you want to add a notice'     
    end
  end
  
  # def after_sign_in_path_for(resource)
    # if current_user.role == 'admin'
      # rooms_path
    # else
      # new_room_path
    # end
  # end
  
  # puts "======"
    # puts params["booking"]["sdate"]
    # puts params["booking"]["enddate"]
#     
    # @available_rooms = Room.includes(:bookings).where(:bookings => { :room_id => nil })
#        
    # puts "------"
    # puts @available_rooms.inspect   
#      
#  
    # respond_to do |format|
      # if @available_rooms.empty?
      # format.html { redirect_to new_room_path, notice: 'no room available in this date'  }        
      # else
         # @book_room = @available_rooms.first    
     # params["booking"]["room_id"] = @book_room.id 
      # @booking = Booking.new(booking_params)  
      # if @booking.save
        # format.html { redirect_to @booking, notice: 'Booking was successfully created.' }
        # format.json { render :show, status: :created, location: @booking }
      # end  
end
