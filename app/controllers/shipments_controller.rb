class ShipmentsController < ApplicationController
  before_action :set_shipment, only: [:show, :edit, :update, :destroy]

  # GET /shipments
  # GET /shipments.json
  def index
    if current_hospital
      @shipments = current_hospital.shipments.all
    else
      redirect_to root_path
    end
  end

  # GET /shipments/1
  # GET /shipments/1.json
  def show
  end

  # GET /shipments/new
  def new
    @shipment     = current_hospital.shipments.new
    @objectives   = [["Objective A", 'objective_a'], ["Objective B", 'objective_b'], ["Objective Q", 'objective_q']]
    @doc_classes  = "multiple_isolates"
  end
  
  # GET /shipments/1/edit
  def edit
    @doc_classes  = "multiple_isolates"
  end

  # POST /shipments
  # POST /shipments.json
  def create
    @shipment = current_hospital.shipments.new(shipment_params)

    if objective = BaseObjective.parent_objectives[params[:objective][:name]]
      bacteria_type = if params.include? :bacteria
        {bacteria_type: params[:bacteria][:type]}
      end

      code_prefix   = params[:bacteria][:type] rescue nil
      starting_code = current_hospital.starting_code_for(objective, code_prefix)

      @shipment.target_isolates.times do |x|
        parent_objective  = objective.new(bacteria_type ||= {})
        
        code_number       = parent_objective.code_prefix+"#{(starting_code + x + 1)}"

        isolate           = @shipment.isolates.new({code_number: code_number})
        isolate.parent    = parent_objective
        isolate.save
      end

      @shipment.update_attribute(:objective_name, "#{objective.name} #{objective.new(bacteria_type ||= {}).name}")
    end

    respond_to do |format|
      if @shipment.save
        format.js
        # format.html { redirect_to @shipment, notice: 'Shipment was successfully created.' }
        # format.json { render :show, status: :created, location: @shipment }
      else
        logger.debug { "error #{@shipment.errors.full_messages}" }
        # format.html { render :new }
        # format.json { render json: @shipment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shipments/1
  # PATCH/PUT /shipments/1.json
  def update
    respond_to do |format|
      if @shipment.update(shipment_params)
        format.html { redirect_to @shipment, notice: 'Shipment was successfully updated.' }
        format.json { render :show, status: :ok, location: @shipment }
      else
        format.html { render :edit }
        format.json { render json: @shipment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shipments/1
  # DELETE /shipments/1.json
  def destroy
    @shipment.destroy
    respond_to do |format|
      format.html { redirect_to shipments_url, notice: 'Shipment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shipment
      @shipment = current_hospital.shipments.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shipment_params
      params.require(:shipment).permit(:target_isolates)
    end
end
