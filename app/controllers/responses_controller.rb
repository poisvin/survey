class ResponsesController < ApplicationController

  def index
    @responses = Response.all
  end

  def new
    # raise params.inspect
    @survey = Enquete.find_by_id(params[:enquete_id])
    @response = Response.find_by_enquete_id_and_user_id(@survey.id, current_user.id)
    if @response
      flash[:notice] = "Survey answered! Please choose another survey."
      redirect_to enquete_response_path(@survey, @response)
    else
      @response = @survey.responses.build
        # raise @survey.questions.size.inspect
      @survey.questions.size.times {@response.answers.build}
    end
  end

  def create
  	@survey = Enquete.find_by_id(params[:enquete_id])
    @response = Response.new(params[:response])
    @response.user = current_user
    if @response.save
    # raise @response.inspect
      redirect_to enquete_response_path(@survey, @response), notice: 'Thank you for taking the survey.'
    else
      render action: "new"
    end
  end


  def show
    @response = Response.find_by_id(params[:id])
    @survey = @response.enquete
  end


  def edit
    @response = Response.find_by_id(params[:id])
  end

  def update
    @response = Response.find_by_id(params[:id])
    if @response.update_attributes(params[:response])
      redirect_to @response, notice: 'Response updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @response = Response.find(params[:id])
    @response.destroy
		redirect_to responses_url 
  end
end
