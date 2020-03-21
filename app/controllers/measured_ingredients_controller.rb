class MeasuredIngredientsController < ApplicationController
  before_action :set_measured_ingredient, only: [:show, :edit, :update, :destroy]

  # GET /measured_ingredients
  # GET /measured_ingredients.json
  def index
    @measured_ingredients = MeasuredIngredient.all
  end

  # GET /measured_ingredients/1
  # GET /measured_ingredients/1.json
  def show
  end

  # GET /measured_ingredients/new
  def new
    @measured_ingredient = MeasuredIngredient.new
  end

  # GET /measured_ingredients/1/edit
  def edit
  end

  # POST /measured_ingredients
  # POST /measured_ingredients.json
  def create
    @measured_ingredient = MeasuredIngredient.new(measured_ingredient_params)

    respond_to do |format|
      if @measured_ingredient.save
        format.html { redirect_to @measured_ingredient, notice: 'Measured ingredient was successfully created.' }
        format.json { render :show, status: :created, location: @measured_ingredient }
      else
        format.html { render :new }
        format.json { render json: @measured_ingredient.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /measured_ingredients/1
  # PATCH/PUT /measured_ingredients/1.json
  def update
    respond_to do |format|
      if @measured_ingredient.update(measured_ingredient_params)
        format.html { redirect_to @measured_ingredient, notice: 'Measured ingredient was successfully updated.' }
        format.json { render :show, status: :ok, location: @measured_ingredient }
      else
        format.html { render :edit }
        format.json { render json: @measured_ingredient.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /measured_ingredients/1
  # DELETE /measured_ingredients/1.json
  def destroy
    @measured_ingredient.destroy
    respond_to do |format|
      format.html { redirect_to measured_ingredients_url, notice: 'Measured ingredient was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_measured_ingredient
      @measured_ingredient = MeasuredIngredient.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def measured_ingredient_params
      params.require(:measured_ingredient).permit(:dish_id, :ingredient_id, :measurement_id)
    end
end
