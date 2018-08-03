require 'pry'
require 'colorize'

class CommandLineInterface
  def greet
    puts "\e[H\e[2J"
    puts "Welcome to NFL Stats Finder.".cyan.bold
  end

  #general get user input method
  def gets_user_input(string)
    puts string.cyan
    gets.chomp
  end

  #ensures input is included in Divison or Team
  def check_user_input(string)
    Division.all.map {|d| d.name}.include?(string.upcase) || Team.all.map {|t| t.name}.include?(string.capitalize)
  end

  #gets team from user input, checks if valid, finds team
  def get_team_from_user_input
    team_name = gets_user_input("\nEnter a team name.")
    if !check_user_input(team_name)
      puts "Bad input!".red
      get_team_from_user_input
    else
      team = Team.find_team(team_name.capitalize)
    end
  end

  #takes team from get_team_from_user_input and shows players or stats
  def show_players_or_stats_from_team_input
    user_team = get_team_from_user_input
    puts "\e[H\e[2J"
    puts "\nNow viewing the #{user_team.city} #{user_team.name}".blue
    show_players_or_stats_from_team_name(user_team)
  end

  #gives division options: teams or stats
  def show_teams_or_stats_from_division_input
    u_division = gets_user_input("\nEnter a division (AFC or NFC).").upcase
    if !check_user_input(u_division)
      puts "Bad input!".red
      show_teams_or_stats_from_division_name
    else
      r_division = Division.find_division(u_division)
      puts "\nNow viewing the #{r_division.name}".blue
      team_or_stats = gets_user_input("\nWhat would you like to see?\n\n (1) #{r_division.name} teams\n (2) #{r_division.name} stats\n (3) Return to main menu")
      case team_or_stats
      when "1"
        Team.show_teams(r_division.find_teams_in_division)
        show_players_or_stats_from_team_input
      when "2"
        show_stats_from_division_name(r_division)
      when "3"
        puts "\e[H\e[2J"
        run
      else
        puts "Bad input!".red
        show_teams_or_stats_from_division_input
    end
    show_teams_or_stats_from_division_input
    end
  end

  #show stats given division name
  def show_stats_from_division_name(division)
    stat_selection = gets_user_input("\nWhich division stats would you like to see? Team in the #{division.name} with the:\n (1) most wins\n (2) most losses\n (3) most touchdowns\n (4) most passing yards\n (5) most rushing yards\n (6) most receptions\n (7) most interceptions\n (8) fewest wins\n (9) fewest losses\n (10) fewest touchdowns\n (11) fewest passing yards\n (12) fewest rushing yards\n (13) fewest receptions\n (14) fewest interceptions\n (15) Return to main menu")
    case stat_selection
    when "1"
      puts "\nmost wins: ".blue
      puts division.get_max_team_name_of_division("team_wins")
    when "2"
      puts "\nmost losses: ".blue
      puts division.get_max_team_name_of_division("team_losses")
    when "3"
      puts "\nmost touchdowns: ".blue
      puts division.get_max_team_name_of_division("totaltd")
    when "4"
      puts "\nmost passing yards: ".blue
      puts division.get_max_team_name_of_division("passnetyards")
    when "5"
      puts "\nmost rushing yards: ".blue
      puts division.get_max_team_name_of_division("rushyards")
    when "6"
      puts "\nmost receptions: ".blue
      puts division.get_max_team_name_of_division("receptions")
    when "7"
      puts "\nmost interceptions: ".blue
      puts division.get_max_team_name_of_division("interceptions")
    when "8"
      puts "\nfewest wins: ".blue
      puts division.get_min_team_name_of_division("team_wins")
    when "9"
      puts "\nfewest losses: ".blue
      puts division.get_min_team_name_of_division("team_losses")
    when "10"
      puts "\nfewest touchdowns: ".blue
      puts division.get_min_team_name_of_division("totaltd")
    when "11"
      puts "\nfewest passing yards: ".blue
      puts division.get_min_team_name_of_division("passnetyards")
    when "12"
      puts "\nfewest rushing yards: ".blue
      puts division.get_min_team_name_of_division("rushyards")
    when "13"
      puts "\nfewest receptions: ".blue
      puts division.get_min_team_name_of_division("receptions")
    when "14"
      puts "\nfewest interceptions: ".blue
      puts division.get_min_team_name_of_division("interceptions")
    when "15"
      puts "\e[H\e[2J"
      run
    else
      puts "Bad input!".red
      show_stats_from_division_name(division)
    end
    show_stats_from_division_name(division)
  end

  #gives team options: players or stats
  def show_players_or_stats_from_team_name(team)
      player_or_stats = gets_user_input("\nAre you interested in:\n\n (1) #{team.name} players\n (2) #{team.name} stats\n (3) Return to main menu")
      case player_or_stats
      when "1"
        team.show_players
      when "2"
        show_stats_from_team_name(team)
      when "3"
        puts "\e[H\e[2J"
        run
      else
        puts "Bad input!".red
        show_players_or_stats_from_team_name(team)
      end
    show_players_or_stats_from_team_name(team)
  end

  #shows stats given team name
  def show_stats_from_team_name(team)
    stat_selection = gets_user_input("\nWhich #{team.name} stats would you like to see?\n (1) Wins and losses\n (2) Passing\n (3) Rushing\n (4) Scoring\n (5) Return to main menu")
    teamstat = Teamstat.find_by team_id: team.team_id
    case stat_selection
    when "1"
      puts "\nThe #{team.name}\n wins: #{teamstat.team_wins}\n losses: #{teamstat.team_losses}".blue
    when "2"
      puts "\nThe #{team.name}\n pass completion percentage: #{teamstat.passpct}\n passing yards: #{teamstat.passnetyards}\n passing touchdowns: #{teamstat.passtd}\n interceptions: #{teamstat.interceptions}\n receptions: #{teamstat.receptions}".blue
    when "3"
      puts "\nThe #{team.name}\n rushing yards: #{teamstat.rushyards}\n rushing touchdowns: #{teamstat.rushtd}\n fumbles: #{teamstat.fumbles}".blue
    when "4"
      puts "\nThe #{team.name}\n total touchdowns: #{teamstat.totaltd}\n rushing touchdowns: #{teamstat.rushtd}\n passing touchdowns: #{teamstat.passtd}\n field goal percentage: #{teamstat.fgpct}".blue
    when "5"
      puts "\e[H\e[2J"
      run
    else
      puts "Bad input!".red
      show_stats_from_team_name(team)
    end
    show_stats_from_team_name(team)
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
      (20) Return to main menu
    ")
    case input
    when "1"
      puts "\nmost wins: ".blue
      Teamstat.get_max("team_wins")
    when "2"
      puts "\nfewest wins: ".blue
      Teamstat.get_min("team_wins")
    when "3"
      puts "\nmost losses: ".blue
      Teamstat.get_max("team_losses")
    when "4"
      puts "\nfewest losses: ".blue
      Teamstat.get_min("team_losses")
    when "5"
      puts "\nmost touchdowns: ".blue
      Teamstat.get_max("totaltd")
    when "6"
      puts "\nfewest touchdowns: ".blue
      Teamstat.get_min("totaltd")
    when "7"
      puts "\nmost passing touchdowns: ".blue
      Teamstat.get_max("passtd")
    when "8"
      puts "\nmost rushing touchdowns: ".blue
      Teamstat.get_max("rushtd")
    when "9"
      puts "\nbest pass completion percentage: ".blue
      Teamstat.get_max("passpct")
    when "10"
      puts "\nlowest pass completion percentage: ".blue
      Teamstat.get_min("passpct")
    when "11"
      puts "\nmost passing yards: ".blue
      Teamstat.get_max("passnetyards")
    when "12"
      puts "\nmost rushing yards: ".blue
      Teamstat.get_max("rushyards")
    when "13"
      puts "\nmost receptions: ".blue
      Teamstat.get_max("receptions")
    when "14"
      puts "\nmost interceptions: ".blue
      Teamstat.get_max("interceptions")
    when "15"
      puts "\nfewest intercptions: ".blue
      Teamstat.get_min("interceptions")
    when "16"
      puts "\nmost fumbles: ".blue
      Teamstat.get_max("fumbles")
    when "17"
      puts "\nfewest fumbles: ".blue
      Teamstat.get_min("fumbles")
    when "18"
      puts "\nhighest field goal percentage: ".blue
      Teamstat.get_max("fgpct")
    when "19"
      puts "\nlowest field goal percentage: ".blue
      Teamstat.get_min("fgpct")
    when "20"
      puts "\e[H\e[2J"
      run
    else
      puts "Bad input!".red
      show_trivia
    end
    show_trivia
  end

  #RUN
  def run
    input = gets_user_input("\nWhat are you interested in?\n\n (1) Division\n (2) Team\n (3) Trivia\n (4) Exit")
    case input
    #(1) division
    when "1"
      puts "\e[H\e[2J"
      show_teams_or_stats_from_division_input
    #(2) team
    when "2"
      puts "\e[H\e[2J"
      Team.show_teams(Team.all)
      show_players_or_stats_from_team_input
    #(3) trivia
    when "3"
      puts "\e[H\e[2J"
      show_trivia
    when "4"
      puts "\e[H\e[2J"
      puts "\nThanks! Now exiting.\n".blue
      exit
    else
      puts "Bad input!".red
      run
    end
    run
  end

end
