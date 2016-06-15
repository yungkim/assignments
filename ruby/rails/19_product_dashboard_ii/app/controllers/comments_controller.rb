class CommentsController < ApplicationController
  def index
    @comments=Comment.all
  end

  def create
    comment = Comment.new(comment: comments_params[:comment], product_id: comments_params[:product_id])
    if comment.save
    else
        flash[:errors] = comment.errors.full_messages
    end
        redirect_to "/products/#{comments_params[:product_id]}"
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    redirect_to "/products/#{params[:product_id]}"
  end
  
  private
    def comments_params
        params.require(:comment).permit(:comment, :product_id)
    end
end
