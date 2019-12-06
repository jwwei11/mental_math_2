Rails.application.routes.draw do
  # Routes for the Setting resource:

  # CREATE
  get("/settings/new", { :controller => "settings", :action => "new_form" })
  post("/create_setting", { :controller => "settings", :action => "create_row" })

  # READ
  get("/settings", { :controller => "settings", :action => "index" })
  get("/settings/:id_to_display", { :controller => "settings", :action => "show" })

  # UPDATE
  get("/settings/:prefill_with_id/edit", { :controller => "settings", :action => "edit_form" })
  post("/update_setting/:id_to_modify", { :controller => "settings", :action => "update_row" })

  # DELETE
  get("/delete_setting/:id_to_remove", { :controller => "settings", :action => "destroy_row" })

  #------------------------------

  devise_for :users
  # Routes for the User resource:

  # READ
  get("/users", { :controller => "users", :action => "index" })
  get("/users/:id_to_display", { :controller => "users", :action => "show" })

  #------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
