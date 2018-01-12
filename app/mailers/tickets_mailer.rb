class TicketsMailer < ApplicationMailer
   def buy_ticket(user, ticket)
    @user = user
    @ticket = ticket
    mail(to: user.email, subject: 'Вы купили билет!')
  end
  def delete_ticket(user, ticket)
    @user = user
    @ticket = ticket
    mail(to: user.email, subject: 'Вы удалили билет!')
  end
end
