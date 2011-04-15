require "spec_helper"

describe EpisodesController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/episodes" }.should route_to(:controller => "episodes", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/episodes/new" }.should route_to(:controller => "episodes", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/episodes/1" }.should route_to(:controller => "episodes", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/episodes/1/edit" }.should route_to(:controller => "episodes", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/episodes" }.should route_to(:controller => "episodes", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/episodes/1" }.should route_to(:controller => "episodes", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/episodes/1" }.should route_to(:controller => "episodes", :action => "destroy", :id => "1")
    end

  end
end
