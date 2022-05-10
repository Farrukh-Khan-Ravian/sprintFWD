# frozen_string_literal: true

class ProjectsController < ApplicationController
  before_action :set_project, except: %i[create new index]

  def index
    @projects = Project.all
  end

  def show
    @project_members = @project.members
  end

  def new
    @project = Project.new
  end

  def edit; end

  def create
    @project = Project.new(project_params)
    if @project.save
      @project.member_projects.create(member_id: params[:member_ids])
      redirect_to projects_path, notice: 'Project was successfully created.'
    else
      render :new, flash[:alert] = 'You do not create project successfully.'
    end
  end

  def update
    if @project.update(project_params)
      @project.member_projects.create(member_id: params[:project][:member_id])
      redirect_to projects_path, notice: 'Project was successfully updated.'
    else
      render :edit, flash[:alert] = 'You do not update project successfully.'
    end
  end

  def destroy
    if @project.destroy
      redirect_to projects_path, notice: 'Project was successfully destroyed.'
    else
      render project, flash[:alert] = 'Project not destroyed successfully.'
    end
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:name)
  end
end
