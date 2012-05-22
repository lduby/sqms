require 'spec_helper'

describe StoriesController do

  before (:each) do
    @story = FactoryGirl.create(:story)
  end

  describe "GET 'show'" do
    
    it "should be successful" do
      get :show, :id => @story.id
      response.should be_success
    end
    
    it "should find the right story" do
      get :show, :id => @story.id
      assigns(:story).should == @story
    end
    
  end

end
