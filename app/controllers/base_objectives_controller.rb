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

  # GET /base_objectives/new
  def new
    @base_objective = BaseObjective.new
  end

  # GET /base_objectives/1/edit
  def edit
  end

  # POST /base_objectives
  # POST /base_objectives.json
  def create
    @base_objective = BaseObjective.new(base_objective_params)

    respond_to do |format|
      if @base_objective.save
        format.html { redirect_to @base_objective, notice: 'Base objective was successfully created.' }
        format.json { render :show, status: :created, location: @base_objective }
      else
        format.html { render :new }
        format.json { render json: @base_objective.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /base_objectives/1
  # PATCH/PUT /base_objectives/1.json
  def update
    respond_to do |format|
      if @base_objective.update(base_objective_params)
        format.html { redirect_to @base_objective, notice: 'Base objective was successfully updated.' }
        format.json { render :show, status: :ok, location: @base_objective }
      else
        format.html { render :edit }
        format.json { render json: @base_objective.errors, status: :unprocessable_entity }
      end
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
      params.require(:base_objective).permit(:parent_type, :parent_id, :age, :sex, :culture_date, :serviceb, :accession_number, :icu, :nosocomial, :code_number, :shipment_id)
    end
end
