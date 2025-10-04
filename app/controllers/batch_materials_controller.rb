class BatchMaterialsController < ApplicationController
  before_action :set_batch
  before_action :set_material, only: [:destroy]

  def new
    @material = Material.new
  end

  def create
    if params[:existing_material_id].present?
      # Selecionar material existente
      @material = Material.find(params[:existing_material_id])
      @batch.materials << @material
      redirect_to @batch, notice: 'Material adicionado ao lote com sucesso!'
    else
      # Criar novo material
      @material = Material.new(material_params)
      
      if @material.save
        @batch.materials << @material
        redirect_to @batch, notice: 'Material criado e adicionado ao lote com sucesso!'
      else
        render :new, status: :unprocessable_entity
      end
    end
  end

  def destroy
    @batch.materials.delete(@material)
    redirect_to @batch, notice: 'Material removido do lote!'
  end

  private

  def set_batch
    @batch = Batch.find(params[:batch_id])
  end

  def set_material
    @material = Material.find(params[:id])
  end

  def material_params
    params.require(:material).permit(:name, :description, :material_type)
  end
end