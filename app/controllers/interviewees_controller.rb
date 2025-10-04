class IntervieweesController < ApplicationController
  before_action :set_interviewee, only: [:show, :edit, :update, :destroy]

  def index
    @interviewees = Interviewee.all.order(created_at: :desc)
  end

  def show
    @interviews = @interviewee.interviews.includes(:batch).order(created_at: :desc)
  end

  def new
    @interviewee = Interviewee.new
  end

  def create
    @interviewee = Interviewee.new(interviewee_params)
    
    if @interviewee.save
      redirect_to interviewees_path, notice: 'Entrevistado criado com sucesso!'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @interviewee.update(interviewee_params)
      redirect_to @interviewee, notice: 'Interviewee was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @interviewee.destroy
    
    respond_to do |format|
      format.turbo_stream { 
        render turbo_stream: [
          turbo_stream.remove(@interviewee),
          turbo_stream.prepend("flash_messages", partial: "shared/notice", 
                              locals: { message: "Entrevistado excluído com sucesso!" })
        ]
      }
      format.html { redirect_to interviewees_url, notice: 'Entrevistado excluído com sucesso!' }
    end
  end

  private

  def set_interviewee
    @interviewee = Interviewee.find(params[:id])
  end

  def interviewee_params
    params.require(:interviewee).permit(:name, :age, :gender, :sector)
  end
end
