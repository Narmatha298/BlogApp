class ApplicationMailer < ActionMailer::Base
  include SessionsHelper
  default from: 'narmathats298@gmail.com'
  layout 'mailer'

end
