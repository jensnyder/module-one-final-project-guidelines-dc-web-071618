require 'pry'

class CommandLineInterface
  def greet
    puts "Welcome to NFL Stats Finder."
  end

  #follows greeting (gets division, team, or trivia)
  def gets_user_input
    puts "Are you interested in a division (1) or a team (2) or trivia (3)?"
    gets.chomp
  end

  #follows (1) selection for divison
  def gets_user_division
    puts "Enter the division (AFC or NFC)"
    gets.chomp
  end

  #follows (2) selection for team
  def gets_user_team
    puts "Enter a team name"
    gets.chomp
  end

  #follows enter team name
  def gets_team_option
    puts "Are you interested in players (1) or stats (2)?"
    gets.chomp
  end

  #follows gets_user_division --> returns teams in said division
  def show_teams_from_division_input
    u_division = gets_user_division
    r_division = find_division(u_division)
    r_teams = find_teams_by_divison(r_division)
    show_teams(r_teams)
  end

  #follows gets_team_option --> returns players on said team
  def show_players_from_team_input(selection)
    r_team = find_team(selection)
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
    selection = gets_user_team
    n_input = gets_team_option #(1- players or 2-stats)
    if n_input == "1"
      show_players_from_team_input(selection)
    elsif n_input == "2"
      selection_stats = find_stats_by_team(selection)
      show_teamstats(selection_stats)
    end
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
    team_names = teams.map do |team|
      team.name
    end
    puts "The teams in this division are: #{team_names}"
  end

  def show_players(players)
    player_names = players.map do |player|
      player.name
    end
    puts "The players on this team are: #{player_names}"
  end

  def find_stats_by_team(team)
    team_instance = find_team(team)
    Teamstat.find_by team_id: team_instance.team_id
  end

  def show_teamstats(teamstat)
    puts "The stats for this team are wins: #{teamstat.team_wins} and losses: #{teamstat.team_losses}"
  end

end
