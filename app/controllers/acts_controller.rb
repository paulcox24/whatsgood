class ActsController < ApplicationController
  before_action :set_act, only: [:show, :edit, :update, :destroy]
  
  def index
    @acts = Act.all
  end

  def show
  end

  def new
    @act = Act.new
  end

  def create
    @act = Act.new(act_params)

    if @act.save
      redirect_to @act
    else
      render :new
    end  
  end

  def edit
  end

  def update
    if @act.update(act_params)
      redirect_to @act
    else
      render :edit
    end  
  end

  def destroy
    @act.destroy
    redirect_to acts_path, notice: 'Act deleted'
  end

  private
  def act_params
    params.require(:act).permit(:description, :name, :website)
  end

  def set_act
    @act = Act.find(params[:id])
  end
end