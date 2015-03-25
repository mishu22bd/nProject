class FileMailer < ActionMailer::Base
  default from: "info@nksoft.com"

  def send_email_file_user(fileusers, file)
  	@file = file
  	fileusers.each do |m|
  		@user_file = User.find(m)
  		@user = @user_file.name
  		puts "File deliver email"
  		puts @user_file.mail
  		puts @user
      mail to: @user_file.mail, subject: "#{file} added to Knowledge Management"
  	end
  end
end