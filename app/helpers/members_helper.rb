# frozen_string_literal: true

module MembersHelper
  def teams
    Team.pluck(:name, :id)
  end
end
