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
    r_division = Division.find_division(u_division)
    r_teams = Team.find_teams_by_divison(r_division)
    Team.show_teams(r_teams)
  end

  #(1) divisions and (2)team
  def show_players_or_stats_from_team_name
    team_name = gets_user_input("Enter a team name")
    team = Team.find_team(team_name)
    player_or_stats = gets_user_input("Are you interested in players (1) or stats (2)?")
    case player_or_stats
    when "1"
      team.show_players
    when "2"
      team.show_stats_from_team_name
    else
      puts "Bad input."
      show_players_or_stats_from_team_name
    end
  end


  def show_trivia
    input = gets_user_input("Select a piece of trivia:\n
      (1) team with the most wins\n
      (2) team with the most losses\n")
    case input
    #(1) wins
    when "1"
      Teamstat.get_max("team_wins")
    #(2) losses
    when "2"
      Teamstat.get_max("team_losses")
    end
  end

  # def get_max(string)
  #   max = Teamstat.maximum(string)
  #   teamstat_max = Teamstat.find_by string.to_sym => max
  #   id = teamstat_max.team_id
  #   team_max = Team.find(id)
  #   puts team_max.name
  # end

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

end
