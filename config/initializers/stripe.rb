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
    order = Order.find_by(checkout_session_id: event.data.object.id)
    order.update(state: 'paid')
  end

  events.subscribe 'payment_intent.canceled' do |event|
    redirect_to products_path, status: :see_other
  end

  events.subscribe 'payout.canceled' do |event|
    redirect_to products_path, status: :see_other
  end

  events.subscribe 'identity.verification_session.canceled' do |event|
    redirect_to products_path, status: :see_other
  end

  events.subscribe 'quote.canceled' do |event|
    redirect_to products_path, status: :see_other
  end

  events.subscribe 'setup_intent.canceled' do |event|
    redirect_to products_path, status: :see_other
  end

  events.subscribe 'source.canceled' do |event|
    redirect_to products_path, status: :see_other
  end

  events.subscribe 'topup.canceled' do |event|
    redirect_to products_path, status: :see_other
  end

  events.subscribe 'transfer.canceled' do |event|
    redirect_to products_path, status: :see_other
  end

end