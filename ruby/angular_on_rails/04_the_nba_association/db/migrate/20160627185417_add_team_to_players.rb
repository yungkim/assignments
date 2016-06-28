class AddTeamToPlayers < ActiveRecord::Migration
  def change
    add_reference :players, :team, index: true, foreign_key: true
  end
end
