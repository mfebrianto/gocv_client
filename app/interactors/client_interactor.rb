class ClientInteractor

  attr_accessor :client

  def initialize(params)
    params.each do |key, value|
      instance_variable_set("@#{key}", value)
    end
  end

  def save_photo
    # check session id tied to user or not
      # yes: update photo of that user
      # no : create new user, save photo and pass back temporary user id
  end

end