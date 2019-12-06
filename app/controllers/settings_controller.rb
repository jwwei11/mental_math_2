class SettingsController < ApplicationController
  before_action :current_user_must_be_setting_owner, :only => [:show, :edit_form, :update_row, :destroy_row]

  def current_user_must_be_setting_owner
    setting = Setting.find(params["id_to_display"] || params["prefill_with_id"] || params["id_to_modify"] || params["id_to_remove"])

    unless current_user == setting.owner
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @q = current_user.settings.ransack(params[:q])
    @settings = @q.result(:distinct => true).includes(:owner, :scores).page(params[:page]).per(10)

    render("setting_templates/index.html.erb")
  end

  def show
    @score = Score.new
    @setting = Setting.find(params.fetch("id_to_display"))

    render("setting_templates/show.html.erb")
  end

  def new_form
    @setting = Setting.new

    render("setting_templates/new_form.html.erb")
  end

  def create_row
    @setting = Setting.new

    @setting.owner_id = params.fetch("owner_id")
    @setting.upper_digit_limit = params.fetch("upper_digit_limit")
    @setting.lower_digit_limit = params.fetch("lower_digit_limit")
    @setting.multiplication = params.fetch("multiplication")
    @setting.addition = params.fetch("addition")
    @setting.division = params.fetch("division")
    @setting.subtraction = params.fetch("subtraction")

    if @setting.valid?
      @setting.save

      redirect_back(:fallback_location => "/settings", :notice => "Setting created successfully.")
    else
      render("setting_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @setting = Setting.find(params.fetch("prefill_with_id"))

    render("setting_templates/edit_form.html.erb")
  end

  def update_row
    @setting = Setting.find(params.fetch("id_to_modify"))

    
    @setting.upper_digit_limit = params.fetch("upper_digit_limit")
    @setting.lower_digit_limit = params.fetch("lower_digit_limit")
    @setting.multiplication = params.fetch("multiplication")
    @setting.addition = params.fetch("addition")
    @setting.division = params.fetch("division")
    @setting.subtraction = params.fetch("subtraction")

    if @setting.valid?
      @setting.save

      redirect_to("/settings/#{@setting.id}", :notice => "Setting updated successfully.")
    else
      render("setting_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_owner
    @setting = Setting.find(params.fetch("id_to_remove"))

    @setting.destroy

    redirect_to("/users/#{@setting.owner_id}", notice: "Setting deleted successfully.")
  end

  def destroy_row
    @setting = Setting.find(params.fetch("id_to_remove"))

    @setting.destroy

    redirect_to("/settings", :notice => "Setting deleted successfully.")
  end
end
