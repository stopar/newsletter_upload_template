class TemplatesController < ApplicationController

  def new
    @new_template = Template.new
  end
  
  
  def create
    @new_template = Template.new(template_params)
    
    if @new_template.save
      redirect_to root_path, notice: "Template created"
    else
      render :new, status: :unprocessable_entity
    end
  end
  
  def show
    @template = Template.last
    
  end
  
  private
  
  def template_params
    params.require(:template).permit(:name, :body)
  end
end
