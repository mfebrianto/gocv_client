class EducationsController < ApplicationController

  def create
    education = Education.new(edu_parameters)
    if education.save
      respond_to do |format|
        format.json { render json: education}
      end
    end
  end

  def show
    edu = Education.find(single_edu_parameter)
    if edu.present?
      respond_to do |format|
        format.json { render json: edu}
      end
    end
  end

  def client
    edus = []
    edus.concat(Education.where(client_id: client_parameter))
    unless edus.empty?
      respond_to do |format|
        format.json { render json: edus}
      end
    end
  end

  private

  def edu_parameters
    params.require(:education).permit(:school_name, :city, :country, :start, :end,
                                       :faculty, :client_id)
  end

  def client_parameter
    params.require(:id)
  end

  def single_edu_parameter
    params.require(:id)
  end

end