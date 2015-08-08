require 'f2/conventions'

class EducationsController < ApplicationController

  def create
    edu = Education.new(edu_parameters)
    parse_date(edu)
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
      edu_hash['start'] = edu.start.strftime('%d/%m/%y')
      edu_hash['end'] = edu.start.strftime('%d/%m/%y')
      respond_to do |format|
        format.json { render json: edu_hash}
      end
    end
  end

  def update
    edu = Education.find(client_parameters_update['id'])
    edu.assign_attributes(client_parameters_update)
    parse_date(edu)
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

  def destroy
    edu = Education.find(single_edu_parameter)
    if edu.delete
      respond_to do |format|
        format.json { render status: :ok, json: {}}
      end
    end
  end

  private

  def parse_date(edu)
    edu.start = Date.strptime(edu_parameters['start'], '%d/%m/%y')
    edu.end = Date.strptime(edu_parameters['end'], '%d/%m/%y')
  end

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