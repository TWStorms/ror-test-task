class SchedulesController < ApplicationController
  before_action :set_schedule, only: %i[show edit update destroy]

  # GET /schedules
  # GET /schedules.json
  def index
    @schedules = Schedule.all

    respond_to do |format|
       format.html
       format.csv { send_data @schedules.to_csv }
    end
  end

  # GET /schedules/1
  # GET /schedules/1.json
  def show;

  end

  # GET /schedules/new
  def new
    @schedule = Schedule.new
  end

  # GET /schedules/1/edit
  def edit; end

  # POST /schedules
  # POST /schedules.json
  def create
    @schedule = Schedule.new(schedule_params.merge(student_schedules_params))

    respond_to do |format|
      if @schedule.save
        format.html { redirect_to @schedule, notice: 'Schedule was successfully created.' }
        format.json { render :show, status: :created, location: @schedule }
      else
        format.html { render :new }
        format.json { render json: @schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /schedules/1
  # PATCH/PUT /schedules/1.json
  def update
    respond_to do |format|
      if @schedule.update(schedule_params)
        format.html { redirect_to @schedule, notice: 'Schedule was successfully updated.' }
        format.json { render :show, status: :ok, location: @schedule }
      else
        format.html { render :edit }
        format.json { render json: @schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /schedules/1
  # DELETE /schedules/1.json
  def destroy
    @schedule.destroy
    respond_to do |format|
      format.html { redirect_to schedules_url, notice: 'Schedule was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_schedule
    @schedule = Schedule.find(params[:id])
  end

 # Only allow a list of trusted parameters through.
   def schedule_params
     params.require(:schedule).permit(:subject, :start_time, :end_time)
   end

   def student_schedules_params
     return {} if params[:schedule][:student_ids].nil?

     @schedule.student_schedules.each(&:mark_for_destruction) if @schedule.present?
     {
       student_schedules_attributes: params[:schedule][:student_ids].reject(&:empty?).map { |id| {student_id: id} }
     }
   end
end
