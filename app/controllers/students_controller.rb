class StudentsController < ApplicationController
  def list
  	@students = Student.all  	
  	@mentors = Mentor.all
  	@newStudent = Student.new
  end
  def new  	
  	params.require(:student).permit!
  	Student.create(params[:student])	  	
	redirect_to :action => "list"
  end
  def delete
  	params.permit(:student_id)  	
  	Student.destroy(params[:student_id])
  	redirect_to :action => "list"
  end
  def edit
  	params.permit(:student_id)
  	@newStudent = Student.find(params[:student_id])
	render status: 200, json: @controller.to_json
  end
end
