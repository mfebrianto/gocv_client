class ScratchController < ApplicationController


  def new
    scratch = Scratch.new
    if scratch.save
      respond_to do |format|
        format.json { render json: scratch}
      end
    end
  end

end