class ClientController < ApplicationController

  def create
    client = Client.new(client_parameters[:client])
    if client.save
      respond_to do |format|
        format.json { render json: client}
      end
    end
  end

  private

  def client_parameters
    params.require(:client).permit(:first_name, :last_name, :dob, :gender)
  end

end