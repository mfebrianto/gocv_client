class ExperiencesController < ApplicationController

  def create
    exp = Experience.new(experience_parameter)
    if exp.save
      respond_to do |format|
        format.json { render json: exp}
      end
    end
  end

  def show
    exp = Experience.find(single_exp_parameter)
    if exp.present?
      respond_to do |format|
        format.json { render json: exp}
      end
    end
  end

  def destroy
    exp = Experience.find(single_exp_parameter)
    if exp.delete
      respond_to do |format|
        format.json { render status: :ok, json: {}}
      end
    end
  end

  def update
    exp = Experience.find(client_parameters_update['id'])
    if exp.update_attributes(client_parameters_update)
      respond_to do |format|
        format.json { render json: exp}
      end
    end
  end

  def client
    exps = []
    exps.concat(Experience.where(client_id: client_parameter))
    unless exps.empty?
      respond_to do |format|
        format.json { render json: exps}
      end
    end
  end

  private

  def client_parameters_update
    params.require(:experience).permit(:id, :client_id, :company_name, :position, :started_on, :ended_on, :current_job)
  end

  def single_exp_parameter
    params.require(:id)
  end

  def client_parameter
    params.require(:id)
  end

  def experience_parameter
    params.require(:experience).permit(:client_id, :company_name, :position,
                                       :started_on, :ended_on, :current_job)
  end
end