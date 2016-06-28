class TeamsController < ApplicationController
  def index
    render :json => Team.all
  end
  def create
    Team.create(team_params)
    #calling the private method
    render_teams
  end
 def destroy
  Team.find(params[:id]).destroy
  render_teams
 end
  private
    #private methods that queries all teams in json format
    def render_teams
      render :json => Team.all
    end
    def team_params
      params.require(:team).permit(:name)
    end
end