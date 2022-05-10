# frozen_string_literal: true

class Member < ApplicationRecord
  belongs_to :team
  has_many :member_projects, dependent: nil
  has_many :project, through: :member_projects

  validates :first_name, :last_name, presence: true

  def name
    [first_name, last_name].join(' ')
  end

  def address
    [city, state, country].join(' ')
  end
end
