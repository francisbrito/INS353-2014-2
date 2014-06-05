require 'spec_helper'

describe Post do
  describe "#initialize" do

    context "with a yaml file" do
      it "should properly load a post from a yaml file"
    end

    context "with proper attributes" do
      it "should properly initialize a post instance"
    end

  end
  describe "#summary" do
    it "should display the first 10 words of text"
  end

  describe "#tagme" do
    it "should be able to tag with 1 tag"
    it "should be able to tag with 4 tags"
  end

  describe "#same?" do
    it "should return true if Title, Date and Text are the same"
    it "should return false if Title, Date and Text are not the same"
  end

  describe "#display_entry" do
    it "should properly output a post entry"
  end

  describe "#save" do
    it "should save the post to a YAML file"
  end

end
