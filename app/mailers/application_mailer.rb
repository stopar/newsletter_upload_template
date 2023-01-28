class ApplicationMailer < ActionMailer::Base
  default from: "from@example.com"
  
  layout "mailer"
  
  # before_action :set_template
  #
  # def set_template
  #   @template = Template.last
  # end
end
