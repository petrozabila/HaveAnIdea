class IdeasController < ApplicationController
  before_action :set_idea, only: [:show, :edit, :update, :destroy]

  
  def index
     @ideas = if params[:search].present?
      Idea.where("name LIKE ? OR description LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%").all.page(params[:page]).per(4)
     else
        @ideas = Idea.all.page(params[:page]).per(4)
     end

     @refferences = Refference.all
  end

 
  def show
  
    @user = @idea.user
    @user.email = @idea.user.email
    #@comments = @idea.comments.page(params[:page])
    #@ideas = Idea.all.page(params[:page]).per(4)
    #@idea.user = Idea.find.where()current_user
    #@idea.user.email = current_user.email
    #@friendship = current_user.friendships
    #@idea = Idea.find(params[:id])
  end

  
  def new
    @idea = Idea.new
  end

 
  def edit
  end

  
  def create
    @idea = Idea.new(idea_params)
    @idea.user_id = current_user.id
    @idea.user = current_user

      @idea.save  
  end

  
  def update
    respond_to do |format|
      if @idea.update(idea_params)
        redirect_to idea_path(params[:id]), notice: 'Idea was successfully added'
        format.html { redirect_to @idea, notice: 'Idea was successfully updated.' }
        format.json { render :show, status: :ok, location: @idea }
      else
        format.html { render :edit }
        format.json { render json: @idea.errors, status: :unprocessable_entity }
      end
    end
  end

  
  def destroy
    @idea.destroy
    respond_to do |format|
      format.html { redirect_to ideas_url, notice: 'Idea was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_idea
      @idea = Idea.find(params[:id])
    end

    def idea_params
      params.require(:idea).permit(:name, :description, :user_id)
    end
end
