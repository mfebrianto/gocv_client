class ExperiencesController < ApplicationController

  def create
    experience = Experience.new(experience_parameter)
    if experience.save
      respond_to do |format|
        format.json { render json: experience}
      end
    end
  end

  private

  def experience_parameter
    params.require(:experience).permit(:client_id, :company_name, :position,
                                       :started_on, :ended_on, :current_job)
  end
end