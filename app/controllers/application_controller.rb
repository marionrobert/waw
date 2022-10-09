class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  # Par la suite ne definir que authenticate user a partir du paiement
end
