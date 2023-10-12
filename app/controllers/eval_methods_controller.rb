class EvalMethodsController < ApplicationController
  before_action :set_eval_method, only: %i[ show edit update destroy ]

  # GET /eval_methods or /eval_methods.json
  def index
    @eval_methods = EvalMethod.all
  end

  # GET /eval_methods/1 or /eval_methods/1.json
  def show
  end

  # GET /eval_methods/new
  def new
    @eval_method = EvalMethod.new
  end

  # GET /eval_methods/1/edit
  def edit
  end

  # POST /eval_methods or /eval_methods.json
  def create
    @eval_method = EvalMethod.new(eval_method_params)

    respond_to do |format|
      if @eval_method.save
        format.html { redirect_to eval_method_url(@eval_method), notice: "Eval method was successfully created." }
        format.json { render :show, status: :created, location: @eval_method }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @eval_method.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /eval_methods/1 or /eval_methods/1.json
  def update
    respond_to do |format|
      if @eval_method.update(eval_method_params)
        format.html { redirect_to eval_method_url(@eval_method), notice: "Eval method was successfully updated." }
        format.json { render :show, status: :ok, location: @eval_method }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @eval_method.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /eval_methods/1 or /eval_methods/1.json
  def destroy
    @eval_method.destroy

    respond_to do |format|
      format.html { redirect_to eval_methods_url, notice: "Eval method was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_eval_method
      @eval_method = EvalMethod.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def eval_method_params
      params.require(:eval_method).permit(:name)
    end
end
