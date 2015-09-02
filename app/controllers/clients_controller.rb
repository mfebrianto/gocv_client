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
    p ">>>>>>>>>>>>>>>>#{upload_photo_params.inspect}"
    client = Client.new(profile_picture: upload_photo_params[:file])
    client_interactor = ClientInteractor.new({client: client, session_id: upload_photo_params[:session_id]})
    # client_interactor.save_photo
    respond_to do |format|
      format.json { render status: :ok, json: {}}
    end
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

  def upload_photo_params
    params.permit(:session_id, :file)
  end

end