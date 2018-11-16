class ContactsController < ApplicationController

  def index
    @contacts = Contact.all
  json_response(@contacts)
  end
end
