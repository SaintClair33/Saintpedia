class ChargesController < ApplicationController

  def new
   @stripe_btn_data = {
     key: "#{ Rails.configuration.stripe[:publishable_key] }",
     description: "BigMoney Membership - #{current_user.name}",
     amount: Amount.default
   }
  end

  def create
    # Creates a Stripe Customer object for associating
    # with the charge
    customer = Stripe::Customer.create(
      email: current_user.email,
      card: params[:stripeToken])

    # Where the real magic happens
    charge = Stripe::Charge.create(
      customer: customer.id, #Note -- this is not the user_id in the app
      amount: Amount.default,
      description: "BigMoney Membership - #{current_user.email}",
      currency: 'usd')

    current_user.update_attributes(role: "premium")

    flash[:notice] = "Thanks for all the money, #{current_user.email}! Feel free to invest again."
    redirect_to root_path#user_path(current_user)

    # Stripe will send back CardErrors, with friendly messages
    # when something goes wrong.
    # This rescue block catches and displays those errors.
    rescue Stripe::CardError => e 
    flash[:error] = e.message
    redirect_to new_charge_path
  end

  def downgrade_user
    current_user.update_attributes(role: "standard")
    redirect_to :back
  end

end



class Amount

  def self.default
    1500
  end

  def self.downgrade
    0
  end

end



