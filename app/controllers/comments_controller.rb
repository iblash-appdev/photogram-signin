class CommentsController < ApplicationController




  def create
    comment = Comment.new
 
 
    comment.author_id = session.fetch(:user_id) #arams.fetch("input_author_id")
    comment.photo_id = params.fetch(:input_photo_id, nil)
    comment.body = params.fetch(:input_body, nil)
 
 
    comment.save

    respond_to do |format|
      format.json do
        render({ :json => comment.as_json })
      end

      format.html do
        redirect_to("/photos/#{comment.photo_id}")
      end
  end
 
end
 
 
end
 