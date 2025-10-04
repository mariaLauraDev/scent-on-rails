class QuestionsController < ApplicationController
  def index
    @questions = Question.includes(:batches).order(:text)
  end

  private

  def set_question
    @question = Question.find(params[:id])
  end
end