require "spec_helper"

describe TagsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/tags" }.should route_to(:controller => "tags", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/tags/new" }.should route_to(:controller => "tags", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/tags/1" }.should route_to(:controller => "tags", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/tags/1/edit" }.should route_to(:controller => "tags", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/tags" }.should route_to(:controller => "tags", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/tags/1" }.should route_to(:controller => "tags", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/tags/1" }.should route_to(:controller => "tags", :action => "destroy", :id => "1")
    end

  end
end
