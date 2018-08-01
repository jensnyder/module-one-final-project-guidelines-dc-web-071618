require 'rest-client'

RestClient.get("https://api.nfl.com/teams?s={"$query":{"season":2015},"$take":40}&fs={id,season,fullName,nickName,abbr,teamType,conference{abbr},division{abbr}}")
