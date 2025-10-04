class BatchesController < ApplicationController
  before_action :set_batch, only: [:show, :edit, :update, :destroy]
  before_action :set_batch_associations, only: [:show, :edit]

  def index
    @batches = Batch.all.order(created_at: :desc)
  end

  def show
    @interviews = @batch.interviews.includes(:user).order(created_at: :desc)
  end

  def new
    @batch = Batch.new
  end

  def edit
  end

  def create
    @batch = Batch.new(batch_params)
    
    if @batch.save
      redirect_to batches_path, notice: 'Lote criado com sucesso!'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @batch.update(batch_params)
      redirect_to @batch, notice: 'Lote atualizado com sucesso!'
    else
      set_batch_associations
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @batch.destroy
    
    respond_to do |format|
      format.turbo_stream { 
        render turbo_stream: [
          turbo_stream.remove(@batch),
          turbo_stream.prepend("flash_messages", partial: "shared/notice", 
                              locals: { message: "Batch was successfully deleted." })
        ]
      }
      format.html { redirect_to batches_url, notice: 'Batch was successfully deleted.', status: :see_other }
    end
  end

  private

  def set_batch
    @batch = Batch.find(params[:id])
  end

  def set_batch_associations
    @materials = @batch.materials.order(:name)
    @questions = @batch.questions.order(:text)
  end

  def batch_params
    params.require(:batch).permit(:name, :description, :start_date, :status)
  end
end
