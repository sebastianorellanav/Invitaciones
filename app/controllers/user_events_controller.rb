class UserEventsController < ApplicationController
  before_action :set_user_event, only: %i[ show edit update destroy]

  # GET /user_events or /user_events.json
  def index
    @user_events = UserEvent.all
  end

  # GET /user_events/1 or /user_events/1.json
  def show
  end

  # GET /user_events/new
  def new
    @user_event = UserEvent.new
  end

  # GET /user_events/1/edit
  def edit
  end

  # POST /user_events or /user_events.json
  def create
    @user = User.find_by_email(user_event_params[:email])
    puts @user
    if @user.nil?
      puts "no existe el usuario"
      @user = User.new(name: "", email: user_event_params[:email])
      @user.save
      puts "Se crea el nuevo usuario"
    end
    @user_event = UserEvent.new(user_id: @user.id, event_id: user_event_params[:event_id], state: "No responde")

    respond_to do |format|
      if @user_event.save
        format.html { redirect_to user_events_url, notice: "Se ha creado la invitación correctamente." }
      format.json { head :no_content }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_events/1 or /user_events/1.json
  def update
    respond_to do |format|
      if @user_event.update(user_event_params)
        format.html { redirect_to user_event_url(@user_event), notice: "User event was successfully updated." }
        format.json { render :show, status: :ok, location: @user_event }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_events/1 or /user_events/1.json
  def destroy
    @user_event.destroy

    respond_to do |format|
      format.html { redirect_to user_events_url, notice: "Se ha eliminado la invitación correctamente." }
      format.json { head :no_content }
    end
  end

  def change_state
    @user_event = UserEvent.find_by_id(params[:id])
    if @user_event
      if @user_event.state == "No responde"
        @user_event.update(state: params[:new_state])
        respond_to do |format|
          format.html { redirect_to user_events_url, notice: "Se ha actualizado el estado de la invitación." }
          format.json { head :no_content }
        end
      else
        respond_to do |format|
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @user_event.errors, status: :unprocessable_entity }
        end
      end
    else
      render status: :not_found, json: { error: "UserEvent no encontrado" }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_event
      @user_event = UserEvent.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_event_params
      params.require(:user_event).permit(:user_id, :event_id, :state, :email)
    end
end
