module GuestUser
  extend ActiveSupport::Concern

  def new_guest
    guest = User.new_guest
    guest.save!(validate: false)
    session[:guest_user_id] = guest.id
    redirect_to root_path
  end
end
