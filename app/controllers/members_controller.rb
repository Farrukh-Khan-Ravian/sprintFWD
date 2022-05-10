# frozen_string_literal: true

class MembersController < ApplicationController
  before_action :set_member, except: %i[create new index]

  def index
    @members = Member.all
  end

  def show; end

  def new
    @member = Member.new
  end

  def edit; end

  def create
    @member = Member.new(member_params)
    # debugger
    if @member.save
      redirect_to members_path, notice: 'Member was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @member.update(member_params)
      redirect_to member_path, notice: 'Member was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @member.destroy
      redirect_to member_path, notice: 'Member was successfully destroyed.'
    else
      render member, flash[:alert] = 'Member not destroyed successfully.'
    end
  end

  private

  def set_member
    @member = Member.find(params[:id])
  end

  def member_params
    params.require(:member).permit(:first_name, :last_name, :city, :state, :country, :team_id)
  end
end
