module CustomTemplateController
  extend ActiveSupport::Concern
  
  def custom_layout
    
    name = "uploaded_template"
    
    # name = Template.last.name
    # The above will work even if you have a 'space' in the name
    
    # Generating the path
    abs_path = Rails.root.join("app/views/layouts/#{name}.html.erb")
    
    html = Template.selected.last.body.html_safe 
    
    # Writing to the file
    File.write(abs_path, html)
    
    name
  end
end