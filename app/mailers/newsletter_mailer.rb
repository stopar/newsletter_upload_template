class NewsletterMailer < ApplicationMailer

  require 'pry'
  layout  :custom_layout
  
  def email(subscriber, email, template)
    @subscriber = subscriber
    @email = email
    @template = template
    
    # wrap_in_template(@email.body, @template.body) { |html| @final_email = html}
    
    # @final_email = wrap_in_template(@email.body, @template.body) do
    #   @email.body
    #   # @final_email = html
    # end
    #
    # @final_email = wrap_in_template2(@email.body) { @template.body }
    
    mail to: @subscriber.email, subject: @email.subject
      
  end
    
  private
  
  def custom_layout
    
    name = "uploaded_layout"
    
    # name = Template.last.name
    # The above will work even if you have a 'space' in the name
    
    # Generating the path
    abs_path = Rails.root.join("app/views/layouts/#{name}.html.erb")
    
    html = Template.last.body.html_safe 
    
    # Writing to the file
    File.write(abs_path, html)
    
    name
  end

end


