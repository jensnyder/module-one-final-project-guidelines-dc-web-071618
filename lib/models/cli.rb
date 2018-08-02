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
    input = gets_user_input("\nSelect a piece of trivia for the 2017 season.
      Which team had the:
      (1) most wins?
      (2) fewest wins?
      (3) most losses?
      (4) fewest losses?
      (5) most touchdowns?
      (6) fewest touchdowns?
      (7) most passing touchdowns?
      (8) most rushing touchdowns?
      (9) best pass completion percentage?
      (10) worst pass completion percentage?
      (11) most passing yards?
      (12) most rushing yards?
      (13) most receptions?
      (14) most interceptions?
      (15) fewest inteceptions?
      (16) most fumbles?
      (17) fewest fumbles?
      (18) highest field goal percentage?
      (19) lowest field goal percentage?
    ")
    case input
    when "1"
      Teamstat.get_max("team_wins")
    when "2"
      Teamstat.get_min("team_wins")
    when "3"
      Teamstat.get_max("team_losses")
    when "4"
      Teamstat.get_min("team_losses")
    when "5"
      Teamstat.get_max("totaltd")
    when "6"
      Teamstat.get_min("totaltd")
    when "7"
      Teamstat.get_max("passtd")
    when "8"
      Teamstat.get_max("rushtd")
    when "9"
      Teamstat.get_max("passpct")
    when "10"
      Teamstat.get_min("passpct")
    when "11"
      Teamstat.get_max("passnetyards")
    when "12"
      Teamstat.get_max("rushyards")
    when "13"
      Teamstat.get_max("receptions")
    when "14"
      Teamstat.get_max("interceptions")
    when "15"
      Teamstat.get_min("interceptions")
    when "16"
      Teamstat.get_max("fumbles")
    when "17"
      Teamstat.get_min("fumbles")
    when "18"
      Teamstat.get_max("fgpct")
    when "19"
      Teamstat.get_min("fgpct")
    end
    show_trivia
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
