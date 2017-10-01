class ChargesController < ApplicationController
  before_action :authenticate_user!, except: [:new]

	def new
		@stripe_btn_data = {
			key:         "#{ Rails.configuration.stripe[:publishable_key] }",
			description: "Blocipedia Membership - #{current_user.name}",
			amount:      1500
		}
	end

	def create
		@amount = 1500

		customer = Stripe::Customer.create(
			email: current_user.email,
			card:  params[:stripeToken]
		)

		charge = Stripe::Charge.create(
			customer:    customer.id,
			amount:      1500,
      description: "Blocipedia Membership - #{current_user.email}",
			currency:    'usd'
		)

		current_user.premium!

		flash[:notice] = "Thanks for upgrading to premium, #{current_user.email}!"
		redirect_to root_path

	rescue Stripe::CardError => e
		flash[:alert] = e.message
		redirect_to new_charge_path
	end

  def destroy
    current_user.standard!

    flash[:notice] = "You're account is now standard and all of your private Wiki's are now public!"
    redirect_to root_path
  end
end
