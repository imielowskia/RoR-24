class GroupsController < ApplicationController
  before_action :set_group, only: %i[ show edit update destroy detailgrade detailgrade_course detailgrade_save]

  # GET /groups or /groups.json
  def index
    @groups = Group.all
  end

  # GET /groups/1 or /groups/1.json
  def show
  end

  # GET /groups/new
  def new
    @group = Group.new
  end

  # GET /groups/1/edit
  def edit
  end


  def detailgrade
    @course = Course.find(params[:course_id])
    @students = @group.students
  end

  def detailgrade_course
    @course = Course.find(params[:course_id])
    @students = @group.students
  end

  def detailgrade_save
    @course = Course.find(params[:course_id])
    @students = @group.students
    oceny = params['oceny']
    @students.each do |s|
      soceny = oceny[s.id.to_s]
      soceny.each do |o|
        if o[1].to_i>0
          if o[0].to_i>0
            xg = DetailGrade.find(o[0].to_i)
            xg.grade = o[1].to_f
          else
            xg = DetailGrade.new
            xg.student_id = s.id
            xg.course_id = @course.id
            xg.grade = xg.grade = o[1].to_f
            xg.data = Date.today
          end
          xg.save
        end
      end
    end
    redirect_to detailgrade_group_path(@group.id, @course.id)
  end

  # POST /groups or /groups.json
  def create
    @group = Group.new(group_params)

    respond_to do |format|
      if @group.save
        format.html { redirect_to @group, notice: "Group was successfully created." }
        format.json { render :show, status: :created, location: @group }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /groups/1 or /groups/1.json
  def update
    respond_to do |format|
      if @group.update(group_params)
        format.html { redirect_to @group, notice: "Group was successfully updated." }
        format.json { render :show, status: :ok, location: @group }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /groups/1 or /groups/1.json
  def destroy
    @group.destroy!

    respond_to do |format|
      format.html { redirect_to groups_path, status: :see_other, notice: "Group was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group
      @group = Group.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def group_params
      params.require(:group).permit(:nr, :nazwa, :field_id, course_ids: [])
    end
end
