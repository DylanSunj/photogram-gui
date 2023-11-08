class PhotosController < ActionController::Base
  def index
    matching_photos = Photo.all

    @list_of_photos = matching_photos.order({ :created_at => :desc})

    render({ :template => "photo_templates/index"})
  end

  def show 
    url_id = params.fetch("path_id")
    matching_photos = Photo.where({ :id => url_id})

    @the_photo = matching_photos.at(0)

    render({ :template => "photo_templates/show"})
  end 

  def bye 
    the_id = params.fetch("toast_id")

    matching_photos = Photo.where({ :id => the_id})

    the_photo = matching_photos.at(0)

    the_photo.destroy
    
    redirect_to("/photos")
  end 

  def create
    input_imagr = params.fetch("query_image")
    input_caption = params.fetch("query_caption")
    input_owner_id = params.fetch("query_owner_id")

    a_new_photo = Photo.new
    a_new_photo.image = input_image
    a_new_photo.caption = input_caption
    a_new_photo.owner_id = input_owner_id

    a_new_photo.save

    redirect_to("/photos/" + a_new_photo.id.to_s)
  end

  def update
    the_id = params.fetch("modify_id")
    matching_photos = Photo.where({ :id => the_id })
    the_photo = matching_photos.at(0) 

    input_image = params.fetch("query_image")
    input_caption = params.fetch("query_caption")

    the_photo.image = input_image
    the_photo.caption = input_caption

    the_photo.save 
    
    redirect_to("/photos/" + the_photo.id.to_s)
  end 

  def comment 
    a_comment = Comment.new

    a_comment.author_id = params.fetch("input_author_id")
    a_comment.photo_id = params.fetch("input_photo_id")
    a_comment.body = params.fetch("input_comment_id")

    a_comment.save

    redirect_to("/photos/" + a_comment.photo_id.to_s)
  end 
end 
