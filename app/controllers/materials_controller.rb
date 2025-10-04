class MaterialsController < ApplicationController
  def index
    @materials = Material.includes(:batches).order(:name)
  end

  private

  def set_material
    @material = Material.find(params[:id])
  end
end