# config/initializers/stripe.rb
Rails.configuration.stripe = {
  publishable_key: ENV['STRIPE_PUBLISHABLE_KEY'],
  secret_key:      ENV['STRIPE_SECRET_KEY'],
  signing_secret:  ENV['STRIPE_WEBHOOK_SECRET_KEY']
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]

StripeEvent.signing_secret = Rails.configuration.stripe[:signing_secret]

# Guide tuto qui ne fonctionne pas
# StripeEvent.configure do |events|
#   events.subscribe 'checkout.session.completed', StripeCheckoutSessionService.new
# end

# Configuration des différents évenements webhook
StripeEvent.configure do |events|

  events.subscribe 'checkout.session.completed' do |event|
    OrdersController.new.paid(checkout_session_id: event.data.object.id)
    # la suite est dans la fonction paid de order
    # order = Order.find_by(checkout_session_id: event.data.object.id)
    # order.update(state: 'paid')
  end

  # events.subscribe 'payment_intent.succeeded' do |event|
  # end


end
