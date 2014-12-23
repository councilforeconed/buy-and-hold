class TeachersController < ApplicationController
  before_action :authenticate_teacher!

  def index
    @students = Student.where(teacher_email: current_teacher.email)
  end

  def destroy_student
    student = Student.find(params[:id])
    student.destroy!
    redirect_to teachers_path
  end

  def set_year
    unless current_teacher.update(current_year: params[:new_year].to_i)
      flash[:alert] = "There was an error adjustung the year."
    end
    redirect_to teachers_path
  end
end