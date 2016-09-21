class UserMailer < ActionMailer::Base
    default :from => "marko_lucic_1994@yahoo.com" #promijeniti adresu

 def registration_confirmation(user)
    @user = user
    mail(:to => "#{user.name} <#{user.email}>", :subject => "Registration Confirmation")
 end