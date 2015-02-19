class StudentsController < ApplicationController
  def list
  	@students = Student.all  	
  	@mentors = Mentor.all
  	@colleges = College.all    
  	@newStudent = Student.new  	
  end
  def new  	
  	params.require(:student).permit!
    studentColleges_Id = params[:college_ids]
  	if params[:student][:id] != ""  	
      
      updatedStudent = params[:student]
      
      StudentCollege.where(student_id: updatedStudent[:id]).destroy_all
  		array = studentColleges_Id.split(/,/)
      array.size.times do |i|        
        StudentCollege.create(student_id: updatedStudent[:id], college_id: array[i])
      end 
  		Student.update(updatedStudent[:id] , :name => updatedStudent[:name], :dob => updatedStudent[:dob], :current_school => updatedStudent[:current_school], :current_level => updatedStudent[:current_level], :country => updatedStudent[:country], :sat_score => updatedStudent[:sat_score] )
  	else
  		newlyAddedStudent = Student.create(params[:student])
      array = studentColleges_Id.split(/,/)
      array.size.times do |i|        
        StudentCollege.create(student_id: newlyAddedStudent[:id], college_id: array[i])
      end
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
