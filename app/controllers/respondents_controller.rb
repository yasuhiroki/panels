class RespondentsController < ApplicationController
  before_action :set_respondent, only: %i[ show edit update destroy ]

  # GET /respondents or /respondents.json
  def index
    @respondents = Respondent.all
  end

  # GET /respondents/1 or /respondents/1.json
  def show
  end

  # GET /respondents/new
  def new
    @respondent = Respondent.new
  end

  # GET /respondents/1/edit
  def edit
  end

  # POST /respondents or /respondents.json
  def create
    @respondent = Respondent.new(respondent_params)

    respond_to do |format|
      if @respondent.save
        session[:respondent_id] = @respondent.id

        format.html { redirect_to rooms_url, notice: "Respondent was successfully created." }
        format.json { render :show, status: :created, location: @respondent }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @respondent.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /respondents/1 or /respondents/1.json
  def update
    respond_to do |format|
      if @respondent.update(respondent_params)
        format.html { redirect_to respondent_url(@respondent), notice: "Respondent was successfully updated." }
        format.json { render :show, status: :ok, location: @respondent }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @respondent.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /respondents/1 or /respondents/1.json
  def destroy
    @respondent.destroy!

    respond_to do |format|
      format.html { redirect_to respondents_url, notice: "Respondent was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_respondent
      @respondent = Respondent.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def respondent_params
      params.require(:respondent).permit(:name)
    end
end
