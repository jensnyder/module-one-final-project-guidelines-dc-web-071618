require 'pry'

class CommandLineInterface
  def greet
    puts "Welcome to NFL Stats Finder."
  end

  #general get user input method
  def gets_user_input(string)
    puts string
    gets.chomp
  end

  #(1) divisions
  def show_teams_from_division_input
    u_division = gets_user_input("Enter the division (AFC or NFC)")
    r_division = find_division(u_division)
    r_teams = find_teams_by_divison(r_division)
    show_teams(r_teams)
  end

  #(1) divisions and (2)team
  def show_players_or_stats_from_team_name
    team_name = gets_user_input("Enter a team name")
    player_or_stats = gets_user_input("Are you interested in players (1) or stats (2)?")
    case player_or_stats
    when "1"
      team = find_team(team_name)
      players = find_players(team)
      show_players(players)
    when "2"
      show_stats_from_team_name(team_name)
    else
      puts "Bad input."
      show_players_or_stats_from_team_name
    end
  end

  #(3) trivia --> stats
  def show_stats_from_team_name(team)
    team_instance = find_team(team)
    teamstat = Teamstat.find_by team_id: team_instance.team_id
    puts "The stats for this team are wins: #{teamstat.team_wins} and losses: #{teamstat.team_losses}"
  end

  def show_trivia
    input = gets_user_input("Select a piece of trivia:\n
      (1) team with the most wins\n
      (2) team with the most losses\n")
    case input
    #(1) wins
    when "1"
      get_max("team_wins")
    #(2) losses
    when "2"
      get_max("team_losses")
    end
  end

  def get_max(string)
    max = Teamstat.maximum(string)
    teamstat_max = Teamstat.find_by string.to_sym => max
    id = teamstat_max.team_id
    team_max = Team.find(id)
    puts team_max.name
  end

  #RUN
  def run
    greet
    input = gets_user_input("Are you interested in a division (1) or a team (2) or trivia (3)?")
    case input
    #(1) division
    when "1"
      show_teams_from_division_input
      show_players_or_stats_from_team_name
    #(2) teams
    when "2"
      show_players_or_stats_from_team_name
    #(3) stats
    when "3"
      # team_name = gets_user_input("Enter a team name")
      # show_stats_from_team_name(team_name)
      show_trivia
    else
      puts "Bad input."
      run
    end
  end

  #HELPER METHODS

  def find_division(division)
    Division.find_by(name: division)
  end

  def find_team(team)
    Team.find_by(name: team)
  end

  def find_teams_by_divison(division)
    Team.where("division_id = ?", division.id)
  end

  def show_teams(teams)
    team_names = teams.map do |team|
      team.name
    end
    puts "The teams in this division are: #{team_names}"
  end

  def find_players(team)
    team.players
  end

  def show_players(players)
    player_names = players.map do |player|
      player.name
    end
    puts "The players on this team are: #{player_names}"
  end

end
