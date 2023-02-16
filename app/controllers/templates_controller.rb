class TemplatesController < ApplicationController
  
  # Custom Layout method is located in this Controller
  include CustomTemplateController
  
  before_action :previous_selected_template, only: [:create, :select_template]

  def new
    @new_template = Template.new
  end
  
  
  def create
    @new_template = Template.new(template_params)
    @new_template.selected = true
    
    if @new_template.save
      previous_template_change_to_unselect(@previous_selected) if @template.count > 1
      redirect_to root_path, notice: "Template created"
    else
      render :new, status: :unprocessable_entity
    end
  end
  
  def show
    @template = Template.last
    
  end
  
  def index
    @templates = Template.all
  end
  
  # If a Template is selected then change the necessary fields and change the layout of the template 
  def select_template
    
    @selected_template = Template.find_by_id(params[:id])
    
    if @template.empty?
      @selected_template.update(selected: true)
      custom_layout
      redirect_to root_path
    else
      @selected_template.update(selected: true)
      @previous_selected.selected = false  
      previous_template_change_to_unselect(@previous_selected)
      custom_layout
      redirect_to root_path
    end

  end
  
  private
  
  def template_params
    params.require(:template).permit(:name, :body)
  end
  
  def previous_selected_template
    @template = Template.selected
    
    unless @template.empty?
      @previous_selected = @template.last
    end
  end
  
  def previous_template_change_to_unselect(previous_selected)
    previous_selected.update(selected: false)
  end
end
