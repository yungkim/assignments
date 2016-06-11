class TimesController < ApplicationController
  def main
    @date = Time.now.strftime("%h %d, %Y") # Oct 26, 2013
    @time = Time.now.strftime("%I:%M %p") # 11:26 AM
  end
end
