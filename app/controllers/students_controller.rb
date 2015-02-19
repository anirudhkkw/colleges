class StudentsController < ApplicationController
  def list
  	@students = Student.all  	
  	@mentors = Mentor.all
  	@newStudent = Student.new  	
  end
  def new  	
  	params.require(:student).permit!

  	if params[:student][:id] != ""  		
  		updatedStudent = params[:student]  		
  		Student.update(updatedStudent[:id] , :name => updatedStudent[:name], :dob => updatedStudent[:dob], :current_school => updatedStudent[:current_school], :current_level => updatedStudent[:current_level], :country => updatedStudent[:country], :sat_score => updatedStudent[:sat_score] )
  	else
  		Student.create(params[:student])
  	end	  	
	redirect_to :action => "list"
  end
  def delete
  	params.permit(:student_id)  	
  	Student.destroy(params[:student_id])
  	redirect_to :action => "list"
  end
  def edit
  	params.permit(:student_id)
  	stud = Student.find(params[:student_id])  	
	render status: 200, json: stud.to_json 
  end
end
