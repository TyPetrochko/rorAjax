class SubjectsController < ApplicationController
  before_action :set_subjects, only: [:index, :new, :create]
  before_action :set_subject, only: [:edit, :destroy]
  
  respond_to :html, :js
  
  def index
  end
  
  def new
    @subject = Subject.new
    respond_to do |format|
      format.html
      format.js
    end
  end
  
  def destroy
    @subject.destroy
    set_subjects
    redirect_to subjects_path
  end
  
  def edit
    @subject.update_attributes(subject_params)
  end
  
  def create
    Subject.new(subject_params).save
    respond_to do |format|
      format.html
      format.js
    end
  end
  
  
  private
  
  def subject_params
    params.require(:subject).permit(:name)
  end
  
  def set_subjects
    @subjects = Subject.all
  end
  
  def set_subject
    @subject = Subject.find(params[:id])
  end
end
