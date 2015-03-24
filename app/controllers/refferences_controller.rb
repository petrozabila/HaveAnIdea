class RefferencesController < ApplicationController
  def index
  	@refferences = Refference.all
  end


  def new
    @refference = Refference.new
  end


  def create
    @refference = Refference.new(refference_params)
    @refference.user_id = current_user.id
    if @refference.save   
    	redirect_to :back
    end
  end


  def destroy
    @refference.destroy
    respond_to do |format|
      format.html { redirect_to :back, notice: 'Refferences was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
    def set_refference
      @refference = Refference.find(params[:id])
    end

    def refference_params
      params.require(:refference).permit(:body, :user_id, :idea_id)
    end
end
