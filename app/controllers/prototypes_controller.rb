class PrototypesController < ApplicationController
      before_action :authenticate_user!, only: [:new, :edit, :delete] 
      before_action :set_prototype, only: [:show, :edit,]
      

  def index
    @prototypes = Prototype.includes(:user)
  end

  def create
    @prototype = Prototype.new(prototype_params)
    #binding.pry
    if @prototype.valid?
      @prototype.save
      redirect_to root_path
    else
      render :new
    end
  end

  def new
    @prototype = Prototype.new
  end

  def show
    @comment = Comment.new
    @comments = @prototype.comments.includes(:user)
  end

  def edit
    unless @prototype.user_id == current_user.id
      redirect_to action: :index
    end
  end

  def update
    @prototype = Prototype.find(params[:id])
    if @prototype.update(prototype_params)
      redirect_to prototype_path
    else
      render :edit
    end
  end

  def destroy
    prototype = Prototype.find(params[:id])
    prototype.destroy
    redirect_to root_path
  end

  private

  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end

  def set_prototype
    @prototype = Prototype.find(params[:id])
  end

end


#if current_user.created_at(prototype_params)
    #  @prototype = Prototype.find(params[:user_id]), 
     # @prototype.save
      #redirect_to root_path
    #else
     # render :index
    #end