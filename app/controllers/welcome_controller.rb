class WelcomeController < ApplicationController

	skip_before_filter :authenticate

  def index
  	@surveys = Enquete.get_all_published_surveys
  end

end
