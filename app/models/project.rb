# frozen_string_literal: true

class Project < ApplicationRecord
  has_many :member_projects, dependent: nil
  has_many :members, through: :member_projects, dependent: nil

  validates :name, presence: true
end
