class ContactsController < ApplicationController


  def index
    @contacts = Contact.all
  json_response(@contacts)
  end

  def create
      @contact = Contact.create!(contact_params)
      json_response(@contact)
  end

  def show
    @contact = Contact.find(params[:id])
    json_response(@contact)
  end


private

  def contact_params
      params.permit(:first_name, :last_name, :phone_number, :email)
  end

end
