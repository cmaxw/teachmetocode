class EpisodesController < ApplicationController
  load_and_authorize_resource :except => [:show]
  
  # GET /episodes
  # GET /episodes.xml
  def index
    @show = Show.find(params[:show_id])
    @episodes = @show.episodes.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @episodes }
    end
  end

  # GET /episodes/1
  # GET /episodes/1.xml
  def show
    @show = Show.find_by_slug(params[:show_id]) || Show.find_by_id(params[:show_id])
    @episode = @show.episodes.find_by_slug(params[:id]) || @show.episodes.find_by_id(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @episode }
    end
  end

  # GET /episodes/new
  # GET /episodes/new.xml
  def new
    @show = Show.find(params[:show_id])
    @episode = Episode.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @episode }
    end
  end

  # GET /episodes/1/edit
  def edit
    @show = Show.find(params[:show_id])
    @episode = Episode.find(params[:id])
  end

  # POST /episodes
  # POST /episodes.xml
  def create
    @show = Show.find(params[:show_id])
    @episode = @show.episodes.build(params[:episode])

    respond_to do |format|
      if @episode.save
        format.html { redirect_to("/#{@show.slug}/#{@episode.slug}", :notice => 'Episode was successfully created.') }
        format.xml  { render :xml => @episode, :status => :created, :location => @episode }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @episode.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /episodes/1
  # PUT /episodes/1.xml
  def update
    @show = Show.find(params[:show_id])
    @episode = @show.episodes.find(params[:id])

    respond_to do |format|
      if @episode.update_attributes(params[:episode])
        format.html { redirect_to(show_episode_url(@show, @episode), :notice => 'Episode was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @episode.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /episodes/1
  # DELETE /episodes/1.xml
  def destroy
    @episode = Episode.find(params[:id])
    @episode.destroy

    respond_to do |format|
      format.html { redirect_to(episodes_url) }
      format.xml  { head :ok }
    end
  end
  
  def import
    @show = Show.find(params[:show_id])
    if request.post?
      wxr = WXR.new(params[:wxr_file].read, @show)
      wxr.parse
    end
  end
end
