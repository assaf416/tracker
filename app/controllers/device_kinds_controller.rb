class DeviceKindsController < ApplicationController
  before_action :set_device_kind, only: %i[ show edit update destroy ]

  # GET /device_kinds or /device_kinds.json
  def index
    @device_kinds = DeviceKind.all
  end

  # GET /device_kinds/1 or /device_kinds/1.json
  def show
  end

  # GET /device_kinds/new
  def new
    @device_kind = DeviceKind.new
  end

  # GET /device_kinds/1/edit
  def edit
  end

  # POST /device_kinds or /device_kinds.json
  def create
    @device_kind = DeviceKind.new(device_kind_params)

    respond_to do |format|
      if @device_kind.save
        format.html { redirect_to @device_kind, notice: "Device kind was successfully created." }
        format.json { render :show, status: :created, location: @device_kind }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @device_kind.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /device_kinds/1 or /device_kinds/1.json
  def update
    respond_to do |format|
      if @device_kind.update(device_kind_params)
        format.html { redirect_to @device_kind, notice: "Device kind was successfully updated." }
        format.json { render :show, status: :ok, location: @device_kind }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @device_kind.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /device_kinds/1 or /device_kinds/1.json
  def destroy
    @device_kind.destroy!

    respond_to do |format|
      format.html { redirect_to device_kinds_path, status: :see_other, notice: "Device kind was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_device_kind
      @device_kind = DeviceKind.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def device_kind_params
      params.expect(device_kind: [ :device_id, :kind_id, :name, :image_url, :price, :descriptio ])
    end
end
