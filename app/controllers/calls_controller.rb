class CallsController < ApplicationController
  before_action :set_call, only: %i[ show edit update destroy ]

  #usuario normal
  before_action  only: %i[:index, :show ] do
    authorize_request (["normal", "ejecutivo", "admin"])
  end
  #usuario ejecutivo
  before_action  only: %i[:new, :edit, :create] do
    authorize_request (["ejecutivo", "admin"])
  end
  #usuario administrador
  before_action  only: %i[:update, :destroy] do
    authorize_request (["admin"])
  end

  # GET /calls or /calls.json
  def index
     @calls = Call.all
     end

  # GET /calls/1 or /calls/1.json
  def show
  end

  # GET /calls/new despliega la vista
  def new
    @call = Call.new
    @
  end

  # GET /calls/1/edit
  def edit
  end

  # POST /calls or /calls.json encargado de la persistencia
  def create
    @call = Call.new(call_params)

    respond_to do |format|
      if @call.save
        format.html { redirect_to call_url(@call), notice: "Call was successfully created." }
        format.json { render :show, status: :created, location: @call }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @call.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /calls/1 or /calls/1.json
  def update
    respond_to do |format|
      if @call.update(call_params)
        format.html { redirect_to call_url(@call), notice: "Call was successfully updated." }
        format.json { render :show, status: :ok, location: @call }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @call.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /calls/1 or /calls/1.json
  def destroy
    @call.destroy

    respond_to do |format|
      format.html { redirect_to calls_url, notice: "Call was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_call
      @call = Call.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def call_params
      params.require(:call).permit(:reason, :detail, :client_id)
    end
end
