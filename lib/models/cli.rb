require 'pry'
require 'colorize'

class CommandLineInterface
  def greet
    puts "Welcome to NFL Stats Finder.".cyan
  end

  #general get user input method
  def gets_user_input(string)
    puts string.cyan
    gets.chomp
  end

  #ensures input is included in Divison or Team
  def check_user_input(string)
    Division.all.map {|d| d.name}.include?(string) || Team.all.map {|t| t.name}.include?(string)
  end

  #(1) divisions
  def show_teams_from_division_input
    u_division = gets_user_input("\nEnter the division (AFC or NFC)")
    if !check_user_input(u_division)
      puts "Bad input!".red
      show_teams_from_division_input
    else
      r_division = Division.find_division(u_division)
      r_teams = Team.find_teams_by_divison(r_division)
      Team.show_teams(r_teams)
    end
  end

  #(1) divisions and (2) team
  def show_players_or_stats_from_team_name
    team_name = gets_user_input("\nEnter a team name")
    if !check_user_input(team_name)
      puts "Bad input!".red
      show_players_or_stats_from_team_name
    else
      team = Team.find_team(team_name)
      player_or_stats = gets_user_input("\nAre you interested in:\n\n (1) players\n (2) stats")
      case player_or_stats
      when "1"
        team.show_players
      when "2"
        team.show_stats_from_team_name
      else
        puts "Bad input!".red
        show_players_or_stats_from_team_name
      end
    end
  end

  def show_trivia
    input = gets_user_input("\nSelect a piece of trivia:\n\n (1) team with the most wins\n (2) team with the most losses")
    case input
    #(1) wins
    when "1"
      Teamstat.get_max("team_wins")
    #(2) losses
    when "2"
      Teamstat.get_max("team_losses")
    else
      puts "Bad input!".red
      show_trivia
    end
  end

  #RUN
  def run
    greet
    input = gets_user_input("\nAre you interested in:\n\n (1) division\n (2) team\n (3) trivia")
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
      show_trivia
    else
      puts "Bad input!".red
      run
    end
  end

end
