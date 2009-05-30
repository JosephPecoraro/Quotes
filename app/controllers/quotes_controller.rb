class QuotesController < ApplicationController

	# General Listing
	# GET /
	# GET /index
	# GET /index.xml
  def index
		@quotes = Quote.all
    respond_to do |format|
			p format
      format.html # index.html.erb
      format.xml  { render :xml => @quotes }
    end
  end


	# View One Individually
	# GET /view/1
	# GET /view/1.xml
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


	# Form to create a new quote
	# GET /new
  def new
		@quote = Quote.new
  end


	# Form to edit a quote
	# GET /edit/1
	def edit
		@quote = Quote.find(params[:id])
	rescue
		redirect_to :action => "index"
	end
	
	# ------------------------
	
	# Create a Quote
	# POST /quotes
  def create
		puts "-------"
		p params
		p params[:quote][:author]
		p params[:quote][:author][:name]
		puts "-------"
		
		# Create the author if it doesn't exist
		params[:quote][:author] = Author.find_or_create_by_name( params[:quote][:author][:name] )
		
		# Create the tags
		# params[:quote][:tags]
		
		# if Author.all(:conditions => { :name => params[:quote][:author][:name] }).empty?
		# 	params[:quote][:author] = Author.create( :name => 'test' )
		# end

		puts "-------"
		p params
		puts "-------"
		
		# Build the Quote
		@quote = Quote.new( params[:quote] )
		p @quote

		# Show the Quote
		redirect_to(@quote)
	end
	
	
	def update
		p params
		puts "HERE"
		redirect_to(@quote)
		# @quote = Quote.find(params[:id])
		# p @quote
	end


end
