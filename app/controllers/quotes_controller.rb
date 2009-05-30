class QuotesController < ApplicationController

  def index
		@quotes = Quote.all
    respond_to do |format|
			p format
      format.html # index.html.erb
      format.xml  { render :xml => @quotes }
    end
  end

  def view
    @quote = Quote.find(params[:id])
    respond_to do |format|
      format.html # view.html.erb
      format.xml  { render :xml => @quote }
    end
	rescue
		redirect_to :action => "index"
  end

	def show
		@quote = Quote.find(params[:id])
		render :action => "view"
	end

  def new
		@quote = Quote.new
  end

	def edit
		@quote = Quote.find(params[:id])
	rescue
		redirect_to :action => "index"
	end
	
	# ------------------------
	
  def create
		@quote = Quote.new( params[:quote] )
		if @quote.save
			flash[:notice] = "Created Quote"
			redirect_to @quote
		else
			render :action => 'new'
		end
	end
	
	def update
		@quote = Quote.find( params[:id] )
		if @quote.update_attributes( params[:quote] )
			flash[:notice] = "Updated Quote"
			redirect_to @quote
		else
			render :action => 'edit'
		end
	end
	
	def destroy
		@quote = Quote.find( params[:id] )
		@quote.destroy
		redirect_to :action => 'index'
	end

end
