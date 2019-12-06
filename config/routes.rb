Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root :to => "settings#index"
  # Routes for the Score resource:

  # CREATE
  get("/scores/new", { :controller => "scores", :action => "new_form" })
  post("/create_score", { :controller => "scores", :action => "create_row" })

  # READ
  get("/scores", { :controller => "scores", :action => "index" })
  get("/scores/:id_to_display", { :controller => "scores", :action => "show" })

  # UPDATE
  get("/scores/:prefill_with_id/edit", { :controller => "scores", :action => "edit_form" })
  post("/update_score/:id_to_modify", { :controller => "scores", :action => "update_row" })

  # DELETE
  get("/delete_score/:id_to_remove", { :controller => "scores", :action => "destroy_row" })
  get("/delete_score_from_setting/:id_to_remove", { :controller => "scores", :action => "destroy_row_from_setting" })

  #------------------------------

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
  get("/delete_setting_from_owner/:id_to_remove", { :controller => "settings", :action => "destroy_row_from_owner" })

  #------------------------------

  devise_for :users
  # Routes for the User resource:

  # READ
  get("/users", { :controller => "users", :action => "index" })
  get("/users/:id_to_display", { :controller => "users", :action => "show" })

  #------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
