class Client < ActiveRecord::Base

  attr_accessor :gender

  before_save :convert_gender

  def convert_gender
    if @gender == 'male'
      self.male_flag = true
    else
      self.male_flag = false
    end
  end

  def gender
    if self.male_flag
      @gender = 'male'
    else
      @gender = 'female'
    end
  end

end