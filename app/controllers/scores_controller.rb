class ScoresController < ApplicationController
  def index
    @scores = Score.page(params[:page]).per(10)

    render("score_templates/index.html.erb")
  end

  def show
    @score = Score.find(params.fetch("id_to_display"))

    render("score_templates/show.html.erb")
  end

  def new_form
    @score = Score.new

    render("score_templates/new_form.html.erb")
  end

  def create_row
    @score = Score.new

    @score.total_score = params.fetch("total_score")
    @score.question_types = params.fetch("question_types")
    @score.response_times = params.fetch("response_times")
    @score.setting_id = params.fetch("setting_id")

    if @score.valid?
      @score.save

      redirect_back(:fallback_location => "/scores", :notice => "Score created successfully.")
    else
      render("score_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_setting
    @score = Score.new

    @score.total_score = params.fetch("total_score")
    @score.question_types = params.fetch("question_types")
    @score.response_times = params.fetch("response_times")
    @score.setting_id = params.fetch("setting_id")

    if @score.valid?
      @score.save

      redirect_to("/settings/#{@score.setting_id}", notice: "Score created successfully.")
    else
      render("score_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @score = Score.find(params.fetch("prefill_with_id"))

    render("score_templates/edit_form.html.erb")
  end

  def update_row
    @score = Score.find(params.fetch("id_to_modify"))

    @score.total_score = params.fetch("total_score")
    @score.question_types = params.fetch("question_types")
    @score.response_times = params.fetch("response_times")
    @score.setting_id = params.fetch("setting_id")

    if @score.valid?
      @score.save

      redirect_to("/scores/#{@score.id}", :notice => "Score updated successfully.")
    else
      render("score_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_setting
    @score = Score.find(params.fetch("id_to_remove"))

    @score.destroy

    redirect_to("/settings/#{@score.setting_id}", notice: "Score deleted successfully.")
  end

  def destroy_row
    @score = Score.find(params.fetch("id_to_remove"))

    @score.destroy

    redirect_to("/scores", :notice => "Score deleted successfully.")
  end
end
