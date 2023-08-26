class DiceTypesController < ApplicationController
  before_action :set_dice_type, only: %i[show edit update destroy order]
  before_action :authorize_admin!
  # GET /dice_types or /dice_types.json
  def index
    @dice_types = DiceType.ordered
  end

  # GET /dice_types/1 or /dice_types/1.json
  def show; end

  # GET /dice_types/new
  def new
    @dice_type = DiceType.new
  end

  # GET /dice_types/1/edit
  def edit; end

  # POST /dice_types or /dice_types.json
  def create
    @dice_type = DiceType.new(dice_type_params)

    respond_to do |format|
      if @dice_type.save
        format.html { redirect_to dice_type_url(@dice_type), notice: 'Dice type was successfully created.' }
        format.json { render :show, status: :created, location: @dice_type }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @dice_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dice_types/1 or /dice_types/1.json
  def update
    respond_to do |format|
      if @dice_type.update(dice_type_params)
        format.html { redirect_to dice_type_url(@dice_type), notice: 'Dice type was successfully updated.' }
        format.json { render :show, status: :ok, location: @dice_type }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @dice_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dice_types/1 or /dice_types/1.json
  def destroy
    @dice_type.destroy

    respond_to do |format|
      format.html { redirect_to dice_types_url, notice: 'Dice type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def order
    position = params[:dice_type][:position].to_i
    @dice_type.insert_at(position)
    head :ok
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_dice_type
    @dice_type = DiceType.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def dice_type_params
    params.require(:dice_type).permit(:name, :sides, :position)
  end

  def authorize_admin!
    redirect_to root_path, alert: 'You are not authorized to access that page.' unless current_user.admin?
  end
end
