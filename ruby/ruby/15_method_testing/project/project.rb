class Project
  attr_accessor :name, :description, :team_member
  def initialize name, description
    @name = name
    @description = description
    @team_member = []
  end
  def elevator_pitch
    "#{@name}, #{@description}"
  end
  def add_to_team(team_member) # should add a new team_member
      @team_member.push(team_member)
  end
end

# p=Project.new("name", "desc")
# p p.add_to_team("ttt")
# p p.name
# p p.team_member
# p p.add_to_team("tdfsfdfdstt")
# p p.team_member