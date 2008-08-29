class Sender < ActionMailer::Base
  
 def mail(user, newsletter)
    from "user@server.com"
    recipients user.email
    subject newsletter.subject
    body :user => user, :newsletter => newsletter
  end
  
 def signup(user)
   from "user@server.com"
   recipients user.email
   subject "Register confirmation"
   body :user => user
 end

end
