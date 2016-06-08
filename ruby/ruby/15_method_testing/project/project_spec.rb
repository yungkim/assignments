require_relative 'project'
RSpec.describe Project do
  # ...
  # building off our previous example lets add a test to make sure our method returns the correct value
  it 'has a method elevator_pitch to explain name and description' do
    #lets create two new projects
    project1 = Project.new('Project 1', 'description 1')
    project2 = Project.new('Project 2', 'description 2')
    #if we call elevator_pitch method we should expect to get that project name and description back
    expect(project1.elevator_pitch).to eq("Project 1, description 1")
    expect(project2.elevator_pitch).to eq("Project 2, description 2")
  end
  it 'has a method add_to_team to add a new team_member' do
    project1 = Project.new('Project 1', 'description 1')
    project2 = Project.new('Project 2', 'description 2')
    project1.add_to_team("team_member1")
    project2.add_to_team("team_member2")
    project1.add_to_team("team_member3")
    project2.add_to_team("team_member4")
    expect(project1.team_member).to eq(["team_member1", "team_member3"])
    expect(project2.team_member).to eq(["team_member2", "team_member4"])
  end
end