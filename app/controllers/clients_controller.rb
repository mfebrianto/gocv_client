class ClientsController < ApplicationController

  def index
    respond_to do |format|
      format.json { render json: Client.all}
    end
  end

  def create
    client = Client.new(client_parameters)
    if client.save
      respond_to do |format|
        format.json { render json: client}
      end
    end
  end

  private

  def client_parameters
    params.require(:client).permit(:first_name, :last_name, :dob, :male_gender)
  end

end