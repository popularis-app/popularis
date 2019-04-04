require 'open-uri'
class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def about_us
  @members = parsed_members
  end

  def terms
  end

  private
  def parsed_members
    url = 'https://juliet-tech.github.io/popularis-api/team/team_members.json'
    serialized_team = open(url).read
    members_json = JSON.parse(serialized_team)
  end
end
