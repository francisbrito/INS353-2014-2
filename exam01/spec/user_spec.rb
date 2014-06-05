require 'spec_helper'

class User
    attr_reader :posts
    def initialize(username)
        @username = username
        @posts = []
    end
    def add_post(date, text, title)
        posts.push Post.new title, text, date
    end
    def posts
        # NOTE: This should work...
        @posts.sort{|a, b| return b.date <=> a.date}
    end
    def list
        posts.each{|p| p.display_entry}
    end
    def find_post_by_title(title)
        index = posts.find_index{|p| p.title == title}
        
        posts.at(index)
    end
end

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
