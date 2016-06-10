class HelloController < ApplicationController
  def index
    puts "hello"
    render text: "Hello CodingDojo!"
  end
  def name
    if params[:id] == "michael"
        redirect_to '/say/hello/joe'
    else
        render text: "Saying Hello %s!" % params[:id].capitalize
    end
  end
end
