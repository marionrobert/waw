class ContactsController < ApplicationController
  include CurrentCart

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      ContactMailer.contact_mail(@contact).deliver
      redirect_to shop_path(Shop.last), success: "Votre message a bien été envoyé"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def thanks
  end

  private
  def contact_params
    params.require(:contact).permit(:first_name, :last_name, :email, :content)
  end
end
