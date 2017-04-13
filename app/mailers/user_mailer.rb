class UserMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'

  def order_email(order, email)
    @order = order
    @email = email
    # @url  = 'http://example.com/login'
    mail(to: @email, subject: "Thank you for your order #{@order.id}")
  end
end
