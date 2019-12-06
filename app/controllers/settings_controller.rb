class SettingsController < ApplicationController
  def index
    @settings = Setting.all

    render("setting_templates/index.html.erb")
  end

  def show
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

    @setting.owner_id = params.fetch("owner_id")
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

  def destroy_row
    @setting = Setting.find(params.fetch("id_to_remove"))

    @setting.destroy

    redirect_to("/settings", :notice => "Setting deleted successfully.")
  end
end
