class SharedPigeonsController < ApplicationController
  before_action :set_pigeon, except: [:show, :destroy]
  before_action :set_shared_pigeon, only: [:show, :destroy]

  def show
    @pigeon_messages = @shared_pigeon.pigeon.pigeon_messages.order(created_at: :desc)
    @pigeon = @shared_pigeon.pigeon
  end

  def new
    @shared_pigeon = SharedPigeon.new
  end

  def create
    @shared_pigeon = @pigeon.shared_pigeons.new(shared_pigeon_params)

    respond_to do |format|
      if @shared_pigeon.save
        format.html { redirect_to @pigeon, notice: 'Pigeon was successfully shared.' }
        format.json { render :show, status: :created, location: @shared_pigeon }
      else
        format.html { render :new }
        format.json { render json: @shared_pigeon.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @shared_pigeon.destroy
    respond_to do |format|
      format.html { redirect_to pigeons_path, notice: 'Pigeon was successfully unshared.' }
      format.json { head :no_content }
    end
  end

  private
    def set_pigeon
      @pigeon = current_user.pigeons.find(params[:pigeon_id])
    end

    def set_shared_pigeon
      @shared_pigeon = @pigeon.shared_pigeons.find(params[:id])
    rescue
      @shared_pigeon = current_user.shared_pigeons.find(params[:id])
    end

    def shared_pigeon_params
      params.require(:shared_pigeon).permit(:user_id, :access)
    end
end
