# module GuestUser
#   extend ActiveSupport::Concern

#   def new_guest
#     guest_user = User.new_guest
#     guest_user.save!(validate: false)
#     session[:guest_user_id] = guest_user.id
#     guest_user
#   end
# end
