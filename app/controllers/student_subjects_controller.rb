class StudentSubjectsController < ApplicationController
  before_action :set_student, only: %i[ destroy ]
  def index
  end
  def new
    @student = StudentSubject.new
    respond_to do |format|
      format.html # For normal requests
      format.js   # For AJAX requests
    end
  end
  def show
    @student = StudentSubject.find(params[:id])
    respond_to do |format|
      format.html # For normal requests
      format.js   # For AJAX requests
    end
  end
  def edit
    @student = StudentSubject.find(params[:id])
    respond_to do |format|
      format.html # For normal requests
      format.js   # For AJAX requests
    end
  end
  def create
  @student = StudentSubject.new(student_params)
  @student.user = current_user
  existing_student = StudentSubject.where(:s_name=>student_params[:s_name],:s_student_name=>student_params[:s_student_name]).last
  
  respond_to do |format|
    if (existing_student.present? && existing_student.update(student_params))
      format.html { redirect_to root_path, notice: "Student Subject was successfully Updated." }
      format.json
    else
      if @student.save
        format.html { redirect_to root_path, notice: "Student Subject was successfully added." }
        format.json
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json 
      end
    end
  end
end

# PATCH/PUT /users/1 or /users/1.json
def update
  @student = StudentSubject.find(params[:id])
  existing_student = StudentSubject.where(:s_name=>student_params[:s_name],:s_student_name=>student_params[:s_student_name]).last
  @student.errors.add(:base,:blank,message:"Subject Already exists for the student") if existing_student.present?
  respond_to do |format|
    if (!@student.errors.present? && @student.update(student_params))
      format.html { redirect_to root_path, notice: "Student Subject was successfully updated." }
      format.json 
    else
      format.html { render :edit, status: :unprocessable_entity }
      format.json 
    end
  end
end

def destroy
  @student.destroy

  respond_to do |format|
    format.html { redirect_to root_path, status: :see_other, notice: "StudentSubject was successfully deleted." }
    format.json { head :no_content }
  end
end

private
  def set_student
    @student = StudentSubject.find(params[:id])
  end

  def student_params
    params.require(:student_subject).permit(:s_name, :s_student_name, :s_mark)
  end
end
