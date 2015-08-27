class ClientsController < ApplicationController

  def show
    respond_to do |format|
      format.json { render json: Client.find(client_id_parameter)}
    end
  end

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

  def upload_photo
    client_interactor = ClientInteractor.new
  end

  def update
    client = Client.find(client_parameters_update[:id])
    if client.update_attributes(client_parameters_update)
      respond_to do |format|
        format.json { render json: client}
      end
    end
  end

  private

  def client_parameters_update
    params.require(:client).permit(:id, :first_name, :last_name, :dob, :male_gender)
  end

  def client_parameters
    params.require(:client).permit(:first_name, :last_name, :dob, :male_gender)
  end

  def client_id_parameter
    params.require(:id)
  end

end