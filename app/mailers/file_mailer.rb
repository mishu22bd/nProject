class FileMailer < ActionMailer::Base
  default from: "info@nksoft.com"

  def send_email_file_user(fileusers, file, id)
    @file = file
    @file_id = id
    puts "File data"
    puts @file_id
    filedata = LinkedFile.where(boxelement_id: id).first
    @filename = filedata.filename
    puts @filename
    fileusers.each do |m|
      @user_file = User.find(m)
      @user = @user_file.name
     
     #puts "File deliver email"
     #puts @user_file.mail
     #puts @user
      mail to: @user_file.mail, subject: " A new file #{@filename} is added to Knowledge Management"
    end
  end
  def send_email_permitted_users

  end
end
