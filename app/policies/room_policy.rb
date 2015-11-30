class RoomPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end


  attr_reader :current_user, :rooms

  def initialize(current_user, rooms)
    @user = current_user
    @post = rooms
  end

  def new?
    puts "dsfssfsdfsdfsd++++++++++++++++++++++++++++++++++++++++"
    @user.role == "admin"
  end

end
