class ContactMailer < ApplicationMailer
  def contact_mail(contact)
    @contact = contact
    mail to: "mrobert148@gmail.com", subject: "Nous contacter"
  end
end
