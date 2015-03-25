class ConsultantsController < ApplicationController

	def new
		#@company_id = params[:company_id]
		@users = User.where(admin: true, companies_id: nil)
	  @consultant = Consultant.new(params[:my_company])
	end

	def show
	end

  def create
    @consultant = Consultant.new(params[:consultant]) 	
    if @consultant.save
      @company = Company.find(@consultant.company_id)
   	  flash[:notice] = "Consultant Added succssfully at #{@company.name}"
   	  redirect_to company_path(@consultant.company_id)
    else
    	render 'new'
    end
  end 
	
end