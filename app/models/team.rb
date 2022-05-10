# frozen_string_literal: true

class Team < ApplicationRecord
  has_many :members, dependent: nil

  validates :name, presence: true
end
