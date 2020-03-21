require 'test_helper'

class MeasuredIngredientsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @measured_ingredient = measured_ingredients(:one)
  end

  test "should get index" do
    get measured_ingredients_url
    assert_response :success
  end

  test "should get new" do
    get new_measured_ingredient_url
    assert_response :success
  end

  test "should create measured_ingredient" do
    assert_difference('MeasuredIngredient.count') do
      post measured_ingredients_url, params: { measured_ingredient: { dish_id: @measured_ingredient.dish_id, ingredient_id: @measured_ingredient.ingredient_id, measurement_id: @measured_ingredient.measurement_id } }
    end

    assert_redirected_to measured_ingredient_url(MeasuredIngredient.last)
  end

  test "should show measured_ingredient" do
    get measured_ingredient_url(@measured_ingredient)
    assert_response :success
  end

  test "should get edit" do
    get edit_measured_ingredient_url(@measured_ingredient)
    assert_response :success
  end

  test "should update measured_ingredient" do
    patch measured_ingredient_url(@measured_ingredient), params: { measured_ingredient: { dish_id: @measured_ingredient.dish_id, ingredient_id: @measured_ingredient.ingredient_id, measurement_id: @measured_ingredient.measurement_id } }
    assert_redirected_to measured_ingredient_url(@measured_ingredient)
  end

  test "should destroy measured_ingredient" do
    assert_difference('MeasuredIngredient.count', -1) do
      delete measured_ingredient_url(@measured_ingredient)
    end

    assert_redirected_to measured_ingredients_url
  end
end
