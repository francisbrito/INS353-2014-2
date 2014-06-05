require 'spec_helper'
require 'yaml'

class Post
    attr_accessor :title, :text, :date, :user
    attr_reader :tags
    def initialize(title, text = nil, date = nil, user = nil)
        file_path = nil
        if title and !text and !date and !user
            # NOTE: Duck-typing a lá JavaScript.
            file_path = title
        end
        if file_path
            # Load post from a YAML file.
            p = YAML::load_file file_path

            title = p.title
            text = p.text
            date = p.date
            user = p.user
        end

        @title = title
        @text = text
        @date = date
        @user = user
        @tags = []
    end
    def summary
        # NOTE: Poor man's truncate_words
        text.split(' ').first(10).join ' '
    end
    def tagme(tag)
        tags.push tag
    end
end

describe Post do
  before :each do
      @angie = User.new 'angie'
      @post = Post.new 'foo', 'bar baz chunky bacon some cat chopper knife makeit ruby js', Time.now, @angie
  end
  describe "#initialize" do

    context "with a yaml file" do
      it "should properly load a post from a yaml file" do
          p = Post.new 'my-post.yml'

          expect(p).not_to be_nil
          expect(p.title).to eql 'foo'
          expect(p.text).to eql 'bar baz'
          expect(p.date).to eql Time.new(2011, 10, 20)
      end
    end

    context "with proper attributes" do
      it "should properly initialize a post instance" do
          p = Post.new 'foo', 'bar baz', Time.new(2011, 10, 20), @angie

          expect(p).not_to be_nil
          expect(p.title).to eql 'foo'
          expect(p.text).to eql 'bar baz'
          expect(p.date).to eql Time.new(2011, 10, 20)
          expect(p.user).to eql @angie
      end
    end

  end
  describe "#summary" do
    it "should display the first 10 words of text" do
        p = Post.new 'foo', 'bar baz chunky bacon some cat chopper knife makeit ruby js', Time.now, @angie

        expect(p.summary).to eql 'bar baz chunky bacon some cat chopper knife makeit ruby'  

        p.title = 'Once upon a time...'

        expect(p.title).to eql 'Once upon a time...'
    end
  end

  describe "#tagme" do
    it "should be able to tag with 1 tag" do
        @post.tagme :junk

        expect(@post.tags.size).to eql 1
        expect(@post.tags).to include :junk
    end
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
