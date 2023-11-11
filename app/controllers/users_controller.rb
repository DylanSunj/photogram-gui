class UsersController < ApplicationController
  def index
    matching_users = User.all 
    @list_of_users = matching_users.order({ :username => :asc})

    render({:template => "user_templates/index"})
  end 

  def show 
    url_username = params.fetch("path_username")
    matching_usernames = User.where({ :username => url_username})

    @the_user = matching_usernames.first

    if @the_user == nil
      redirect_to("/404")
    else
      render({ :template => "user_templates/show"})
    end
  end

  def create
    user = User.new
    user.username = params.fetch("username_id")
    user.save 

    redirect_to("/users/" + user.username.to_s)
  end

  def update
    username_check = params.fetch("input_username")
    user_id = params.fetch(:user_id)
    user = User.where({ :username => user_id})
    user_selected = user.at(0)
    user_selected.username = username_check
    user_selected.save

    redirect_to("/users/" + user_selected.username.to_s)
  end
end
