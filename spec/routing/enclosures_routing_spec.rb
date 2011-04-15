require "spec_helper"

describe EnclosuresController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/enclosures" }.should route_to(:controller => "enclosures", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/enclosures/new" }.should route_to(:controller => "enclosures", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/enclosures/1" }.should route_to(:controller => "enclosures", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/enclosures/1/edit" }.should route_to(:controller => "enclosures", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/enclosures" }.should route_to(:controller => "enclosures", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/enclosures/1" }.should route_to(:controller => "enclosures", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/enclosures/1" }.should route_to(:controller => "enclosures", :action => "destroy", :id => "1")
    end

  end
end
