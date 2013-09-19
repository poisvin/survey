class EnquetesController < ApplicationController
  before_filter :admin_login
	def index
    @surveys = Enquete.all()

    respond_to do |format|
      format.html
      format.json { render json: @surveys }
    end
  end

  def show
    @survey = Enquete.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @survey }
    end
  end

  def new
    @survey = Enquete.new
    @questions = Question.types
    3.times {@survey.questions.build}
    respond_to do |format|
      format.html
      format.json { render json: @survey }
    end
  end


  def edit
    @survey = Enquete.find(params[:id])
    @questions = Question.types
  end

  def create
    @questions = Question.types
    @survey = Enquete.new(params[:enquete])
    respond_to do |format|
      if @survey.save
        format.html { redirect_to @survey, notice: 'Survey was successfully created.' }
        format.json { render json: @survey, status: :created, location: @survey }
      else
        format.html { render action: "new" }
        format.json { render json: @survey.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @questions = Question.types
    @survey = Enquete.find(params[:id])
    respond_to do |format|
      if @survey.update_attributes(params[:enquete])
        format.html { redirect_to @survey, notice: 'Survey was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
    @survey = Enquete.find(params[:id])
    @survey.destroy
    redirect_to enquetes_url
  end
end
