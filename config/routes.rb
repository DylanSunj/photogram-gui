Rails.application.routes.draw do

  get("/", { :controller => "users", :action => "index"})

  get("/users", { :controller => "users", :action => "index"})

  get("/users/:path_username", { :controller => "users", :action => "show"})

  post("/insert_user", { :controller => "users", :action => "create"})

  post("/update_user/:user_id", { :controller => "users", :action => "update"})

  get("/photos", { :controller => "photos", :action => "index"})

  get("/photos/:path_id", { :controller => "photos", :action => "show"})

  get("/delete_photo/:toast_id", { :controller => "photos", :action => "bye"})

  post("/insert_photo", { :controller => "photos", :action => "create"})

  post("/update_photo/:modify_id", { :controller => "photos", :action => "update"})

  post("/add_comment", { :controller => "photos", :action => "comment"})

end
