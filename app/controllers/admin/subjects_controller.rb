class Admin::SubjectsController < ApplicationController
  before_action :load_subject, only: [:edit, :update, :destroy]
  def new
    @subject = Subject.new
  end

  def create
    @subject = Subject.new subject_params
    if @subject.save
      flash[:success] = "Add subject success!"
      redirect_to admin_subjects_path
    else
      render :new
      flash[:danger] = "Add subject failed!"
    end
  end


  def index
    @subjects = Subject.paginate(page: params[:page])
  end

  def edit
  end

  def update
    if @subject.update_attributes subject_params
      flash[:success] = "Update Success!"
      redirect_to admin_subjects_path
    else
      flash[:danger] = "Update Failed!"
      render :edit
    end
  end

  def destroy
    if @subject.destroy
      flash[:success] =  "subject_deleted"
    else
      flash[:danger] =  "subject_delete_fail"
    end
    redirect_to admin_subjects_path
  end

  private
  def subject_params
    params.require(:subject).permit :name, :description
  end
  def load_subject
    @subject = Subject.find_by id: params[:id]
    if @subject.nil?
      flash[:danger] = "Subject not found"
      redirect_to admin_subjects_path
    end
  end
  end
