class NewsletterMailer < ApplicationMailer

  # Custom Layout method is located in this Controller
  include CustomTemplateController
  
  # require 'pry'
  layout  :custom_layout
  
  def email(subscriber, email, template)
    @subscriber = subscriber
    @email = email
    @template = template
    
    mail to: @subscriber.email, subject: @email.subject
      
  end
    
  private
  
  # def custom_layout
  #
  #   name = "uploaded_template"
  #
  #   # name = Template.last.name
  #   # The above will work even if you have a 'space' in the name
  #
  #   # Generating the path
  #   abs_path = Rails.root.join("app/views/layouts/#{name}.html.erb")
  #
  #   html = Template.selected.last.body.html_safe
  #
  #   # Writing to the file
  #   File.write(abs_path, html)
  #
  #   name
  # end

end


