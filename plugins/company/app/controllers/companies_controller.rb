class CompaniesController < ApplicationController
  unloadable
  before_filter :set_company, :only => [:show, :edit, :update, :destroy ]
  before_filter :require_login
  caches_action :robots
  helper :issues
  include IssuesHelper
  #helper :projects
  helper :queries
  include QueriesHelper
  helper :members 
  helper :users

  def index
    @companies = Company.all
  end
# responsible for showing company data
  def show
   # @company = Company.find(params[:id])
   @users = User.where(companies_id: @company.id)
  end
  
  def new
    @company =  Company.new
  end

  def create
    @company = Company.new(params[:company])
    
    if @company.save
      flash[:notice] = "Successfully saved"

     else
     render 'new'
     end 
  end

  def edit
   # @company =  @company = Company.find(params[:id])
  end

  

  def update
   # @company = Company.find(params[:id])
    if @company.update_attributes(params[:company])
       flash[:notice] = "Successfully updated"
    else
      render 'edit'
    end
    redirect_to @company
  end
 def destroy
   #@company = Company.find(params[:id])
   if @company.destroy
    flash[:notice] = "Company deleted"
    redirect_to companies_path
  end
 end
  
  private

   def set_company
     @company = Company.find(params[:id])
   end

end

