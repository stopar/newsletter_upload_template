class EmailsController < ApplicationController
  before_action :set_template, only: [:index, :create]
  
  def index
    @emails = Email.all
    # @template = Template.selected.last
  end

  def new
    @email = Email.new
  end

  def show
    @email = Email.find(params[:id])
  end

  def create
    @email = Email.new(email_params)
    # @template = Template.last
    
    if @email.save
      Subscriber.all.each do |subscriber|
        NewsletterMailer.email(subscriber, @email, @template).deliver_now
      end
      redirect_to emails_path, notice: "Email sent"
    else
      render :new, status: :unprocessable_entity
    end
  end
  
  def show_template
    @template = Template.last
  end

  private

    def email_params
      params.require(:email).permit(:subject, :body)
    end
    
    def set_template
      @template = Template.selected.last
    end
end