Division.create(name: "AFC")
Division.create(name: "NFC")

Team.create(name: "Cardinals", city:"Arizona", division_id: 26)
Team.create(name: "Falcons", city: "Atlanta", division_id: 26)
Team.create(name: "Ravens", city: "Baltimore", division_id: 25)
Team.create(name: "Saints", city: "New Orleans", division_id: 26)

Player.create(name: "Justin Tucker", number: 9, position_id: :k, team_id: 39)
Player.create(name: "David Johnson", number: 31, position_id: :rb, team_id: 37)
Player.create(name: "Larry Fitzgerald", number: 11, position_id: :wr, team_id: 37)
Player.create(name: "Drew Brees", number: 9, position_id: :qb, team_id: 40)
Player.create(name: "Maxx Williams", number: 87, position_id: :te, team_id: 39)
Player.create(name: "Matt Bryant", number: 3, position_id: :k, team_id: 38)
