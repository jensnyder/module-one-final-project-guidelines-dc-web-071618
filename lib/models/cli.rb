require 'pry'

class CommandLineInterface
  def greet
    puts "Welcome to NFL Stats Finder."
  end

  def gets_user_input
    puts "Are you interested in a division (1) or a team (2)?"
    gets.chomp
  end

  def gets_user_division
    puts "Enter the division (AFC or NFC)"
    gets.chomp
  end

  def gets_user_team
    puts "Enter a team name"
    gets.chomp
  end

  def show_teams_from_division_input
    u_division = gets_user_division
    r_division = find_division(u_division)
    r_teams = find_teams_by_divison(r_division)
    show_teams(r_teams)
  end

  def show_players_from_team_input
    u_team = gets_user_team
    r_team = find_team(u_team)
    r_players = find_players(r_team)
    show_players(r_players)
  end

  def run
    greet
    input = gets_user_input
    #doesn't allow for faulty input
    while input != "1" && input != "2"
      puts "Wrong format!"
      input = gets_user_input
    end
    #divisions
    if input == "1"
      show_teams_from_division_input
    end
    #teams
    show_players_from_team_input
  end

  def find_division(division)
    Division.find_by(name: division)
  end

  def find_teams_by_divison(division)
    Team.where("division_id = ?", division.id)
  end

  def find_team(team)
    Team.find_by(name: team)
  end

  def find_players(team)
    team.players
  end

  def show_teams(teams)
    teams.each do |team|
      puts team.name
    end
  end

  def show_players(players)
    players.each do |player|
      puts player.name
    end
  end

end
