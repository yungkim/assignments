class PlayersController < ApplicationController
  def index
    render_players
  end
  def create
    Player.create(player_params)
    #calling the private method
    render_players
  end
 def destroy
  Player.find(params[:id]).destroy
  render_players
 end
  private
    #private methods that queries all players in json format
    def render_players
      players = Team.joins(:players).select("*")
      teams = Team.all
      render :json => { :players => players, :teams => teams }
    end
    def player_params
      params.require(:player).permit(:first_name, :last_name, :team_id)
    end
end