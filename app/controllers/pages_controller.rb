require 'open-uri'
class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: [:home]


  def home
  end

  def about_us
    @members = parsed_members['Equipo']
  end

  def terms
  end

  private

  def parsed_members
    url = 'https://raw.githubusercontent.com/juliet-tech/popularis-api/master/team/team_members.json'
    serialized_team = open(url).read
    members_json = JSON.parse(serialized_team)
  end
end
