class TypeStatesController < ApplicationController
  before_action :set_type_state, only: %i[ show edit update destroy ]

  # GET /type_states or /type_states.json
  def index
    @type_states = TypeState.all
  end

  # GET /type_states/1 or /type_states/1.json
  def show
  end

  # GET /type_states/new
  def new
    @type_state = TypeState.new
  end

  # GET /type_states/1/edit
  def edit
  end

  # POST /type_states or /type_states.json
  def create
    @type_state = TypeState.new(type_state_params)

    respond_to do |format|
      if @type_state.save
        format.html { redirect_to type_state_url(@type_state), notice: "Type state was successfully created." }
        format.json { render :show, status: :created, location: @type_state }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @type_state.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /type_states/1 or /type_states/1.json
  def update
    respond_to do |format|
      if @type_state.update(type_state_params)
        format.html { redirect_to type_state_url(@type_state), notice: "Type state was successfully updated." }
        format.json { render :show, status: :ok, location: @type_state }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @type_state.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /type_states/1 or /type_states/1.json
  def destroy
    @type_state.destroy

    respond_to do |format|
      format.html { redirect_to type_states_url, notice: "Type state was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_type_state
      @type_state = TypeState.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def type_state_params
      params.require(:type_state).permit(:name)
    end
end
