class InvestmentsController < ApplicationController

  def destroy
    investment = Investment.find(params[:id])
    company = investment.company
    if investment.destroy
      flash[:investment_notice] = "You are no longer investing in #{company}."
    else
      flash[:investment_notice] = "Can cannot modify this investment."
    end
    redirect_to student_path(current_student), status: 303
  end

end
