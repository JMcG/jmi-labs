class BaseObjectivesController < ApplicationController
  before_action :set_base_objective, only: [:show, :edit, :update, :destroy]

  # GET /base_objectives
  # GET /base_objectives.json
  def index
    @base_objectives = BaseObjective.all
  end

  # GET /base_objectives/1
  # GET /base_objectives/1.json
  def show
  end

  def check_requirements
    if @objective = BaseObjective.parent_objectives[params[:id]]
      
      respond_to do |format|
        format.js
      end

    else
      head 404
    end
  end

  # GET /base_objectives/new
  def new
    if objective = BaseObjective.parent_objectives[params[:id]]
      @base_objective = BaseObjective.new
      @objective = @base_objective.parent = objective.new
    end


    respond_to do |format|
      format.js
    end
  end

  # GET /base_objectives/1/edit
  def edit
  end

  # POST /base_objectives
  # POST /base_objectives.json
  def create
    @base_objective = BaseObjective.new(base_objective_params)

    if @base_objective.save
      head 200
    end
  end

  # PATCH/PUT /base_objectives/1
  # PATCH/PUT /base_objectives/1.json
  def update
    if @base_objective.update(base_objective_params)
      head 200
    end
  end

  # DELETE /base_objectives/1
  # DELETE /base_objectives/1.json
  def destroy
    @base_objective.destroy
    respond_to do |format|
      format.html { redirect_to base_objectives_url, notice: 'Base objective was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_base_objective
      @base_objective = BaseObjective.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def base_objective_params
      params.require(:base_objective).permit!
    end
end
