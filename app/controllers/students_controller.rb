class StudentsController < ApplicationController

  add_flash_types :investment_alert, :investment_notice

  def index
    if current_student
      redirect_to student_path(current_student.id)
    else
      redirect_to root_path
    end
  end

  def create
    flash[:alert] = nil
    access_code = params[:student][:access_code]
    if access_code
      user_provided_access_code(access_code)
    else
      create_new_student
    end
  end

  def new
    @student = Student.new
  end

  def show
    if session[:student].nil? || session[:student] != params[:id].to_i
      flash[:alert] = "You cannot view another students information."
      redirect_to current_student ? student_path(session[:student]) : root_path
    else
      @student = Student.includes(:investments, :stocks).find(params[:id])
      @stocks = Stock.all
    end
  end

  def make_investment
    redirect_to student_path(session[:student])

    stock_id, quantity = params[:investment][:stock_id], params[:investment][:quantity].to_i
    investment = current_student.investments.new(stock_id: stock_id, quantity: quantity)

    stock = Stock.find(stock_id)
    investment_amount = stock.price(current_student.current_year) * quantity

    if current_student.portfolio_value + investment_amount  > 100_000
      return flash[:investment_alert] = 'You cannot invest more than $100,000.'
    end

    if quantity.to_i <= 0
      return flash[:investment_alert] = 'You have to buy at least one share of that stock.'
    end

    if current_student.stocks.pluck(:id).include? stock_id.to_i
      return flash[:investment_alert] = 'You already own that stock.'
    end

    unless investment.save
      flash[:investment_alert] = investment.errors
    end

  end

  def destroy_investment
    redirect_to student_path(session[:student])
    investment = Investment.find(params[:investment][:id])
    notice = "You are no longer investings in #{investment.company}."
    investment.destroy
    flash[:investment_notice] = notice
  end

  def destroy
    session[:student] = nil
    flash[:notice] = "You have been logged out."
    redirect_to new_student_path
  end

  private

  def user_provided_access_code(access_code)
    @student = Student.find_by(access_code: access_code) || Student.new
    return handle_invalid_access_code unless @student.id
    session[:student] = @student.id
    redirect_to student_path(@student.id)
  end

  def handle_invalid_access_code
    flash[:alert] = "That is not a valid access code.\
                     Try again or sign up as a new student."
    render 'new' unless @student.id
  end

  def create_new_student
    @student = Student.new(student_params)
    if @student.save
      session[:student] = @student.id
      redirect_to student_path(@student.id)
    else
      render 'new'
    end
  end

  def student_params
    params.require(:student).permit(:name, :teacher_email, :section_code, :student_id)
  end

end
