require "spec_helper"

describe ShowsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/shows" }.should route_to(:controller => "shows", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/shows/new" }.should route_to(:controller => "shows", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/shows/1" }.should route_to(:controller => "shows", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/shows/1/edit" }.should route_to(:controller => "shows", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/shows" }.should route_to(:controller => "shows", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/shows/1" }.should route_to(:controller => "shows", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/shows/1" }.should route_to(:controller => "shows", :action => "destroy", :id => "1")
    end

  end
end
