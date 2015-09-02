class ClientInteractor

  attr_accessor :client

  def initialize(params)
    params.each do |key, value|
      instance_variable_set("@#{key}", value)
    end
  end

end