class TimesController < ApplicationController
    @@count =0
  def index
    @@count +=1
    render text: "You visited this url %i time" % @@count
  end
  def restart
    @@count = 0
    render text: "Destroyed the session!"
  end
end
