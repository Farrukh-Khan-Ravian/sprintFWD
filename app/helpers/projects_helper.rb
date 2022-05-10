# frozen_string_literal: true

module ProjectsHelper
  def members
    Member.pluck(:first_name, :id)
  end
end
