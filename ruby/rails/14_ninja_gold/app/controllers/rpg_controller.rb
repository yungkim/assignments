class RpgController < ApplicationController
  @@gold_counter = 0
  @@activity_updater = []
  def index
     @gold=@@gold_counter
     @activities=@@activity_updater
  end
  def farm
    farm_money=rand(10..20)
    @@gold_counter+=farm_money
    @@activity_updater.prepend("activity":"Earned #{farm_money} golds from the farm! #{Time.now.strftime('%Y/%M/%d %I:%M %p')}", "color":"green")
      redirect_to '/'
  end
  def cave
    cave_money=rand(5..10)
    @@gold_counter+=cave_money
    @@activity_updater.prepend("activity":"Earned #{cave_money} golds from the cave! #{Time.now.strftime('%Y/%M/%d %I:%M %p')}", "color":"green")
      redirect_to '/'
  end
  def house
    house_moeny=rand(2..5)
    @@gold_counter+=house_moeny
    @@activity_updater.prepend("activity":"Earned #{house_moeny} golds from the house! #{Time.now.strftime('%Y/%M/%d %I:%M %p')}", "color":"green")
      redirect_to '/'
  end
  def casino
    casino_money = rand(-50..50)
    @@gold_counter+=casino_money
    if casino_money >= 0
        @@activity_updater.prepend("activity":"Entered a casino and won #{casino_money} golds... Yes! #{Time.now.strftime('%Y/%M/%d %I:%M %p')}", "color":"green")
    else
        @@activity_updater.prepend("activity":"Entered a casino and lost #{casino_money} golds... Ouch.. #{Time.now.strftime('%Y/%M/%d %I:%M %p')}", "color":"red")
    end
      redirect_to '/'
  end
  def clear
    @@gold_counter=0
    @@activity_updater=[]
      redirect_to '/'
  end
end
