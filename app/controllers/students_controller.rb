

class StudentsController < ApplicationController
  before_action :set_student, only: :show
  
  def index
    @students = Student.all
  end

  def show
    # @student = Student.find(params[:id])
    set_student
    if @student.active
      @status = 'active'
    else
      @status = 'inactive'
    end
  end

  def activate
    set_student
    @student.active = !@student.active 
    @student.save
    redirect_to student_path(@student)

  end

  private

    def set_student
      @student = Student.find(params[:id])
    end
end