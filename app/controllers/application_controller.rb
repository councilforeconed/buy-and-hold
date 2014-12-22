class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def current_student
    @_current_student ||= session[:student] &&
        Student.find_by(id: session[:student])
  end

  def ensure_student_is_logged_in
    unless current_student
      flash[:alert] = "You me be logged in."
      redirect_to new_student_path
    end
  end

  def after_sign_up_path_for(resource)
    teachers_path(resource)
  end
end
