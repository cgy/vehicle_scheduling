module TripsHelper
  def ing?(user)
    @trip_user = TripUser.find(user.id)
    if @trip_user.nil?
      false
    else
      true
    end
  end
end
