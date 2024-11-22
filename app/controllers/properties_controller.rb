# app/controllers/properties_controller.rb
class PropertiesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_property, only: [:show, :edit, :update, :destroy]
  before_action :authorize_owner!, only: [:edit, :update, :destroy]

  def index
    @properties = Property.all
  end

  def show
    @owner = @property.user
  end

  def new
    @property = current_user.properties.build
  end

  def create
    @property = current_user.properties.build(property_params)
    if @property.save
      redirect_to @property, notice: 'Le bien a été créé avec succès.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @property.update(property_params)
      redirect_to @property, notice: 'Le bien a été mis à jour avec succès.'
    else
      render :edit
    end
  end

  def destroy
    @property.destroy
    redirect_to properties_path, notice: 'Le bien a été supprimé avec succès.'
  end

  private

  def set_property
    @property = Property.find(params[:id])
  end

  def authorize_owner!
    redirect_to properties_path, alert: 'Non autorisé' unless @property.user == current_user
  end

  def property_params
    params.require(:property).permit(:title, :price, :description)
  end
end
