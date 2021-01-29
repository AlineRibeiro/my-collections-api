# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: "alinear.mail+1@example.com"
  layout 'mailer'
end
