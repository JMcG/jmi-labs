require 'test_helper'

class BaseObjectivesControllerTest < ActionController::TestCase
  setup do
    @base_objective = base_objectives(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:base_objectives)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create base_objective" do
    assert_difference('BaseObjective.count') do
      post :create, base_objective: { accession_number: @base_objective.accession_number, age: @base_objective.age, code_number: @base_objective.code_number, culture_date: @base_objective.culture_date, icu: @base_objective.icu, nosocomial: @base_objective.nosocomial, parent_id: @base_objective.parent_id, parent_type: @base_objective.parent_type, serviceb: @base_objective.serviceb, sex: @base_objective.sex, shipment_id: @base_objective.shipment_id }
    end

    assert_redirected_to base_objective_path(assigns(:base_objective))
  end

  test "should show base_objective" do
    get :show, id: @base_objective
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @base_objective
    assert_response :success
  end

  test "should update base_objective" do
    patch :update, id: @base_objective, base_objective: { accession_number: @base_objective.accession_number, age: @base_objective.age, code_number: @base_objective.code_number, culture_date: @base_objective.culture_date, icu: @base_objective.icu, nosocomial: @base_objective.nosocomial, parent_id: @base_objective.parent_id, parent_type: @base_objective.parent_type, serviceb: @base_objective.serviceb, sex: @base_objective.sex, shipment_id: @base_objective.shipment_id }
    assert_redirected_to base_objective_path(assigns(:base_objective))
  end

  test "should destroy base_objective" do
    assert_difference('BaseObjective.count', -1) do
      delete :destroy, id: @base_objective
    end

    assert_redirected_to base_objectives_path
  end
end
