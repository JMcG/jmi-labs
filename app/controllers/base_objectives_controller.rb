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

  def select_objective
    if objective = BaseObjective.parent_objectives[params[:id]]
      logger.debug { objective }
      @objective = objective.new
      @base_objective = @objective.build_base_objective(:parent => @objective)
    end

    respond_to do |format|
      format.js { render @base_objective }
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
  #   respond_to do |format|
  #     if @base_objective.save
  #       format.html { redirect_to @base_objective, notice: 'Base objective was successfully created.' }
  #       format.json { render :show, status: :created, location: @base_objective }
  #     else
  #       format.html { render :new }
  #       format.json { render json: @base_objective.errors, status: :unprocessable_entity }
  #     end
  #   end
  end

  # PATCH/PUT /base_objectives/1
  # PATCH/PUT /base_objectives/1.json
  def update
    if @base_objective.update(base_objective_params)
      head 200
    end
    # respond_to do |format|
    #   if @base_objective.update(base_objective_params)
    #     format.html { redirect_to @base_objective, notice: 'Base objective was successfully updated.' }
    #     format.json { render :show, status: :ok, location: @base_objective }
    #   else
    #     format.html { render :edit }
    #     format.json { render json: @base_objective.errors, status: :unprocessable_entity }
    #   end
    # end
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
