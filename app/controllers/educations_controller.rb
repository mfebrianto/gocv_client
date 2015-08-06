class EducationsController < ApplicationController

  def create
    education = Education.new(edu_parameters)
    if education.save
      respond_to do |format|
        format.json { render json: education}
      end
    end
  end

  private

  def edu_parameters
    params.require(:education).permit(:school_name, :city, :country, :start, :end,
                                       :faculty, :client_id)
  end

end