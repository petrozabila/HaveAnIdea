class CommentsController < ApplicationController
	def index
    @idea = Idea.find(params[:idea_id])
    @comments = @idea.comments.paginate(:page => params[:page], :per_page => 3)
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
    @idea = Idea.find(params[:idea_id])
    @comments = @idea.comments
    
  end

  # GET /comments/new
  def new
    @comment = Comment.new(:idea_id => params[:idea_id])
    @idea = Idea.find(params[:idea_id])
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments
  # POST /comments.json
  def create
    @idea = Idea.find(params[:idea_id])
    @comment = @idea.comments.new(comment_params)
    @comment.user_id = current_user.id
    @comment.user = current_user
    
    if
    @comment.save
    redirect_to @idea
      end
  end
  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to comments_url, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between action
    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:body, :parent_id, :user_id, :idea_id)
    end
end
