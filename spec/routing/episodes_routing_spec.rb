require "spec_helper"

describe EpisodesController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/shows/1/episodes" }.should route_to(:controller => "episodes", :action => "index", :show_id => "1")
    end

    it "recognizes and generates #new" do
      { :get => "/shows/1/episodes/new" }.should route_to(:controller => "episodes", :action => "new", :show_id => "1")
    end

    it "recognizes and generates #show" do
      { :get => "/shows/1/episodes/1" }.should route_to(:controller => "episodes", :action => "show", :id => "1", :show_id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/shows/1/episodes/1/edit" }.should route_to(:controller => "episodes", :action => "edit", :id => "1", :show_id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/shows/1/episodes" }.should route_to(:controller => "episodes", :action => "create", :show_id => "1")
    end

    it "recognizes and generates #update" do
      { :put => "/shows/1/episodes/1" }.should route_to(:controller => "episodes", :action => "update", :id => "1", :show_id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/shows/1/episodes/1" }.should route_to(:controller => "episodes", :action => "destroy", :id => "1", :show_id => "1")
    end

  end
end
