class StudentSubjectsController < ApplicationController
  before_action :_set_student_subject, only: %i[show edit update destroy]
  before_action :_set_student, only: %i[new create]

  def edit; end

  def show; end

  def update
    if @student_schedule.update(_student_schedule_params)
      render :show
    else
      render :edit
    end
  end

  def new
    @student_schedule = StudentSchedule.new
  end

  def create
    @student_schedule = StudentSchedule.new _student_schedule_params
    @student_schedule.teacher = @student
    if @student_schedule.save
      flash[:notice] = 'Schedule was successfully added'
    else
      render :new
    end
  end

  def destroy
    @student_schedule.destroy!
    flash[:notice] = 'Schedule was successfully removed'
  end

  private

  def _set_student_schedule
    @student_schedule = StudentSchedule.find params[:id]
  end

  def _set_student
    @Student = Student.find params[:student_id]
  end

  def _student_schedule_params
    params.require(:student_schedule).permit(:schedule_id)
  end
end
