class EnclosuresController < ApplicationController
  # GET /enclosures
  # GET /enclosures.xml
  def index
    @enclosures = Enclosure.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @enclosures }
    end
  end

  # GET /enclosures/1
  # GET /enclosures/1.xml
  def show
    @enclosure = Enclosure.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @enclosure }
    end
  end

  # GET /enclosures/new
  # GET /enclosures/new.xml
  def new
    @enclosure = Enclosure.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @enclosure }
    end
  end

  # GET /enclosures/1/edit
  def edit
    @enclosure = Enclosure.find(params[:id])
  end

  # POST /enclosures
  # POST /enclosures.xml
  def create
    @enclosure = Enclosure.new(params[:enclosure])

    respond_to do |format|
      if @enclosure.save
        format.html { redirect_to(@enclosure, :notice => 'Enclosure was successfully created.') }
        format.xml  { render :xml => @enclosure, :status => :created, :location => @enclosure }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @enclosure.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /enclosures/1
  # PUT /enclosures/1.xml
  def update
    @enclosure = Enclosure.find(params[:id])

    respond_to do |format|
      if @enclosure.update_attributes(params[:enclosure])
        format.html { redirect_to(@enclosure, :notice => 'Enclosure was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @enclosure.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /enclosures/1
  # DELETE /enclosures/1.xml
  def destroy
    @enclosure = Enclosure.find(params[:id])
    @enclosure.destroy

    respond_to do |format|
      format.html { redirect_to(enclosures_url) }
      format.xml  { head :ok }
    end
  end
end
