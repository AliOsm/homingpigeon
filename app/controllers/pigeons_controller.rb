class PigeonsController < ApplicationController
  before_action :set_pigeon, only: [:show, :edit, :update, :destroy]

  # GET /pigeons
  # GET /pigeons.json
  def index
    @pigeons = Pigeon.all
  end

  # GET /pigeons/1
  # GET /pigeons/1.json
  def show
  end

  # GET /pigeons/new
  def new
    @pigeon = Pigeon.new
  end

  # GET /pigeons/1/edit
  def edit
  end

  # POST /pigeons
  # POST /pigeons.json
  def create
    @pigeon = current_user.pigeons.new(pigeon_params)

    respond_to do |format|
      if @pigeon.save
        format.html { redirect_to @pigeon, notice: 'Pigeon was successfully created.' }
        format.json { render :show, status: :created, location: @pigeon }
      else
        format.html { render :new }
        format.json { render json: @pigeon.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pigeons/1
  # PATCH/PUT /pigeons/1.json
  def update
    respond_to do |format|
      if @pigeon.update(pigeon_params)
        format.html { redirect_to @pigeon, notice: 'Pigeon was successfully updated.' }
        format.json { render :show, status: :ok, location: @pigeon }
      else
        format.html { render :edit }
        format.json { render json: @pigeon.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pigeons/1
  # DELETE /pigeons/1.json
  def destroy
    @pigeon.destroy
    respond_to do |format|
      format.html { redirect_to pigeons_url, notice: 'Pigeon was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pigeon
      @pigeon = current_user.pigeons.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pigeon_params
      params.require(:pigeon).permit(:name, :description)
    end
end
