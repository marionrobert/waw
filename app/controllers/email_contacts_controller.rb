class EmailContactsController < ApplicationController
  def new
  end

  def create
    @contact = EmailContact.new(email_params)
    if @contact.save
      flash[:success] = "Vous avez été ajouté à notre liste de diffusion !"
    else
      flash[:error] = "Une erreur est survenue. Veuillez réessayer."
    end
    redirect_to root_path
  end

  private

  def email_params
    params.require(:email_contact).permit(:email)
  end
end
