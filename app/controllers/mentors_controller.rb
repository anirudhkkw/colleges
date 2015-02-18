class MentorsController < ApplicationController
  def list
  	@mentors = Mentor.all
  end
end
