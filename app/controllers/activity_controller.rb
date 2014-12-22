class ActivityController < ApplicationController
  def index
    @student = Student.new
  end
end
