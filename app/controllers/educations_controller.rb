require 'f2/conventions'

class EducationsController < ApplicationController

  def create
    edu = Education.new(edu_parameters)
    edu.start = Date.parse(edu_parameters['start'])
    edu.end = Date.parse(edu_parameters['end'])
    if edu.save
      respond_to do |format|
        format.json { render json: edu}
      end
    end
  end

  def show
    edu = Education.find(single_edu_parameter)
    if edu.present?
      edu_hash = edu.attributes
      edu_hash['start'] = edu.start.strftime('%d/%m/%Y')
      edu_hash['end'] = edu.start.strftime('%d/%m/%Y')
      respond_to do |format|
        format.json { render json: edu_hash}
      end
    end
  end

  def update
    edu = Education.find(client_parameters_update['id'])
    edu.assign_attributes(client_parameters_update)
    edu.start = Date.parse(edu_parameters['start'])
    edu.end = Date.parse(edu_parameters['end'])
    if edu.save
      respond_to do |format|
        format.json { render json: edu}
      end
    end
  end

  def client
    edus = []
    edus.concat(Education.where(params[:id]))
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

  def client_parameters_update
    params.require(:education).permit(:id, :school_name, :city, :country, :start, :end,
                                      :faculty)
  end

end