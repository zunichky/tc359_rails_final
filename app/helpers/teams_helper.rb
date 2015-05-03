require 'rubygems'
require 'nokogiri'
require 'open-uri'

module TeamsHelper
  def getTeams()
    url = "http://www.nhl.com/stats/team?fetchKey=20152ALLSAAAll&ord=desc&sort=points&viewName=summary"
    doc = Nokogiri::HTML(open(url))
    count = 0
    doc.search('tr').each do |row|
      count += 1
      #gets rid of pointless beginning data
      if count > 4
        teamData = row.search('a/text()').collect {|text| text.to_s}
        statsData = row.search('td/text()').collect {|text| text.to_s}

        existingTeam = ""
        @teams.each do |team|
          if team.name == teamData[0]
            existingTeam = team
            break
          end
        end

        if existingTeam == ""
          @team = Team.new
          @team.name = teamData[0]
          @team.gamesPlayed = statsData[1]
          @team.wins = statsData[2]
          @team.losses = statsData[3]
          @team.otLosses = statsData[4]
          @team.points = statsData[5]
          @team.nhlTeam = true
          @team.save
        else
          #update stats
          existingTeam.gamesPlayed = statsData[1]
          existingTeam.wins = statsData[2]
          existingTeam.losses = statsData[3]
          existingTeam.otLosses = statsData[4]
          existingTeam.points = statsData[5]
          existingTeam.save
        end
      end
    end
  end

  def searchTeams(teamName)
    @searchResult = @teams.search(teamName)
    return @searchResult
  end
end
