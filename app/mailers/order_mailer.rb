class OrderMailer < ApplicationMailer

default from: 'no-reply@jungle.com'

  def send_order_email(order, current_user)
    @current_user = current_user
    @order = order
    mail( :to => @current_user.email,
    :subject => "Thanks for the order #{@order.id}" )
  end



end
