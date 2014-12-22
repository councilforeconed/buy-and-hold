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
end