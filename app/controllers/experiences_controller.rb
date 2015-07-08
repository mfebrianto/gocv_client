class ExperiencesController < ApplicationController

  def create
    exp = Experience.new(experience_parameter)
    if exp.save
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

  def client_parameter
    params.require(:id)
  end

  def experience_parameter
    params.require(:experience).permit(:client_id, :company_name, :position,
                                       :started_on, :ended_on, :current_job)
  end
end