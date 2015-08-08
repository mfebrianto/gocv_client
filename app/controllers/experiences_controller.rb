class ExperiencesController < ApplicationController

  def create
    exp = Experience.new(experience_parameter)
    parse_date(exp)
    if exp.save
      respond_to do |format|
        format.json { render json: exp}
      end
    end
  end

  def show
    exp = Experience.find(single_exp_parameter)
    if exp.present?
      exp_hash = exp.attributes
      exp_hash['started_on'] = exp.started_on.strftime(F2::Conventions.date)
      exp_hash['ended_on'] = exp.ended_on.strftime(F2::Conventions.date)
      respond_to do |format|
        format.json { render json: exp_hash}
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
    exp.assign_attributes(client_parameters_update)
    parse_date(exp)
    if exp.update_attributes(client_parameters_update)
      respond_to do |format|
        format.json { render json: exp}
      end
    end
  end

  def client
    exps = []
    exps.concat(Experience.where(client_id: client_parameter))
    respond_to do |format|
      format.json { render json: exps}
    end
  end

  private

  def parse_date(exp)
    exp.started_on = Date.strptime(experience_parameter['started_on'], F2::Conventions.date)
    exp.ended_on = Date.strptime(experience_parameter['ended_on'], F2::Conventions.date)
  end

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