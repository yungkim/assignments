class SayController < ApplicationController
  def index
    render text: "What do you want me to say???"       
  end 

  def hello
    render text: "Saying Hello!"
  end
end
