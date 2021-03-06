class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :edit, :update, :destroy]

  # GET /groups
  # GET /groups.json
  def index
    @groups = Group.all
  end

  # GET /groups/1
  # GET /groups/1.json
  def show
    @group = Group.find(params[:id])
    @assignments = @group.assignments
    
    @course = Course.find(@group.course_id)
    @subscriptions = @course.subscriptions
  end

  # GET /groups/new
  def new
    @course = Course.find(current_user.id)
    @group = @course.groups.build
    # @group = Group.new
  end

  # GET /groups/1/edit
  def edit
    @group = Group.find(params[:id])
  end

  # def add
  #   @assignment = @group
  # end

  # POST /groups
  # POST /groups.json
  def create
    @course = Course.find(params[:course_id])
    @group = @course.groups.create
    # redirect_to 'courses'
    # @group = Group.new(group_params)

    respond_to do |format|
      if @group.save
        format.html { redirect_to @course, notice: 'Group was successfully created.' }
        format.json { render :show, status: :created, location: @group }
      else
        format.html { render :new }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /groups/1
  # PATCH/PUT /groups/1.json
  def update
    respond_to do |format|
      if @group.update(group_params)
        format.html { redirect_to @group, notice: 'Group was successfully updated.' }
        format.json { render :show, status: :ok, location: @group }
      else
        format.html { render :edit }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /groups/1
  # DELETE /groups/1.json
  def destroy
    @course = Course.find(@group.course_id)
    @group.destroy
    respond_to do |format|
      format.html { redirect_to @course, notice: 'Group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group
      @group = Group.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def group_params
      params.require(:group).permit(:name, :project_status, :score, :course_id, :project_title, :project_description, :named)
    end
end
