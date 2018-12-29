module V1
  class ContactsController < ApplicationController
    # @return [Object]
    before_action :authenticate_user!
    def index
      @contacts = Contact.all
      render status: :ok
    end

    def show
      @contact = Contact.where(id: params[:id]).first
      if @contact.present?
        render json: @contact, status: :ok
      else
        render json: nil?, status: :no_content
      end
    end

    def create
      @contact = Contact.new(contact_params)
      @contact.save
      render json: @contact, status: :created
    end

    def destroy
      @contact = Contact.where(id: params[:id]).first
      if @contact.destroy
        head(:ok)
      else
        head(:unprocessable_entity)
      end
    end

    private

    def contact_params
      params.require(:contact).permit(:first_name, :last_name, :email)
    end
  end
end
