# frozen_string_literal: true

class TeamsController < ApplicationController
  before_action :set_team, except: %i[create new index]

  def index
    @teams = Team.all
  end

  def show
    @team_members = @team.members
  end

  def new
    @team = Team.new
  end

  def edit; end

  def create
    @team = Team.new(team_params)
    if @team.save
      redirect_to teams_path, notice: 'Team was successfully created.'
    else
      render :new, flash[:alert] = 'You do not create team successfully.'
    end
  end

  def update
    if @team.update(team_params)
      redirect_to teams_path, notice: 'Team was successfully updated.'
    else
      render :edit, flash[:alert] = 'You do not create team successfully.'
    end
  end

  def destroy
    if @team.destroy
      redirect_to teams_path, notice: 'Team was successfully destroyed.'
    else
      render team, flash[:alert] = 'Team not destroyed successfully.'
    end
  end

  private

  def set_team
    @team = Team.find(params[:id])
  end

  def team_params
    params.require(:team).permit(:name)
  end
end
