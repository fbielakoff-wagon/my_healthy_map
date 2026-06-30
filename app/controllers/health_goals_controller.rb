class HealthGoalsController < ApplicationController
  def index
    @health_goals = HealthGoal.all
  end

  def show
    @health_goal = HealthGoal.find(params[:id])
  end

  def new
    @health_goal = HealthGoal.new
  end

  def create
    @health_goal = HealthGoal.new(health_goal_params)
    @health_goal.user = current_user
    if @health_goal.save
      redirect_to health_goal_path(@health_goal)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @health_goal = HealthGoal.find(params[:id])
    @health_goal.destroy
    redirect_to health_goals_path
  end

  def edit
    @health_goal = HealthGoal.find(params[:id])
  end

  def update
    @health_goal = HealthGoal.find(params[:id])
    if @health_goal.update(health_goal_params)
      redirect_to health_goal_path(@health_goal)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def health_goal_params
    params.require(:health_goal).permit(:name, :module, :content, :system_prompt)
  end
end
