class BatchQuestionsController < ApplicationController
  before_action :set_batch
  before_action :set_question, only: [:destroy]

  def new
    @question = Question.new
  end

  def create
    if params[:existing_question_id].present?
      # Selecionar pergunta existente
      @question = Question.find(params[:existing_question_id])
      @batch.questions << @question
      redirect_to @batch, notice: 'Pergunta adicionada ao lote com sucesso!'
    else
      # Criar nova pergunta
      @question = Question.new(question_params)
      
      if @question.save
        @batch.questions << @question
        redirect_to @batch, notice: 'Pergunta criada e adicionada ao lote com sucesso!'
      else
        render :new, status: :unprocessable_entity
      end
    end
  end

  def destroy
    @batch.questions.delete(@question)
    redirect_to @batch, notice: 'Pergunta removida do lote!'
  end

  private

  def set_batch
    @batch = Batch.find(params[:batch_id])
  end

  def set_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:text, :description, :question_type)
  end
end