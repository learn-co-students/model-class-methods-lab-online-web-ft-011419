class ClassificationsController < ApplicationController
  
  def index
    @classifications = Classification.all
  end

  def show
    @classification = Classification.find(params[:id])
  end

  def new
    @classiciation = Classiciation.new
  end

  def create
    @classiciation = Classiciation.new(classiciation_params)

    if @classiciation.save
      redirect_to @classiciation
    else
      render :new
    end
  end

  def edit
    @classiciation = Classiciation.find(params[:id])
  end

  def update
    @classiciation = Classiciation.find(params[:id])

    @classiciation.update(classiciation_params)

    if @classiciation.save
      redirect_to @classiciation
    else
      render :edit
    end
  end

  def destroy
    @classiciation = classiciation.find(params[:id])
    @classiciation.destroy
    flash[:notice] = "classiciation deleted."
    redirect_to classiciations_path
  end

  private

  def classiciation_params
    params.require(:classiciation).permit(:name)
  end
end