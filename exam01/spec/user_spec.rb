require 'spec_helper'

describe User do

  describe "#initialize" do
    it "should properly initialize with an username"
  end

  describe "#add_post" do
    it "should add a post to the posts list"
  end

  describe "#list" do
    it "should properly ouput all posts"
  end

  describe "#find_post_by_title" do
    it "should return a post by title"
    it "should return the first one if there are several with the same name"
  end

end
