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
    def tagme(*new_tags)
        # NOTE: `*` before param name is the "splat" operator.

        new_tags.each {|t| tags.push t}
    end
    def same?(other)
        # Yes, am in a hurry.
        other.title == self.title and other.text == self.text and other.date == self.date
    end
    def display_entry
        msg = "%s, %d-%d-%d\n%s\n%s\nTags: " % [user.username, date.year, date.month, date.day, title, text]

        tags.each{|t| msg << t}

        # Return for easier testing.
        msg
    end
    def save
        # NOTE: Poor man's slugify
        file_path = title.split(' ').join('-') << '.yml'

        File::open file_path, 'w' do |f|
            f.write YAML::dump(self)
        end
    end
end

describe Post do
  before :each do
      @angie = User.new 'angie'
      @post = Post.new 'foo', 'bar baz chunky bacon some cat chopper knife makeit ruby js', Time.new(2011, 10, 20), @angie
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
    it "should be able to tag with 4 tags" do
        @post.tagme :junk, :randomness, :wtf, :gotosleep

        expect(@post.tags.size).to eql 4
        expect(@post.tags).to include :junk, :randomness, :wtf, :gotosleep
    end
  end

  describe "#same?" do
    it "should return true if Title, Date and Text are the same" do
        other = Post.new 'foo', 'bar baz chunky bacon some cat chopper knife makeit ruby js', Time.new(2011, 10, 20), @angie

        expect(@post.same? other).to eql true 
    end
    it "should return false if Title, Date and Text are not the same" do
        other = Post.new 'some', 'thing else', Time.now, @angie

        expect(@post.same? other).to eql false
    end
  end

  describe "#display_entry" do
    it "should properly output a post entry"
  end

  describe "#save" do
    it "should save the post to a YAML file" do
        @post.save

        other = Post.new 'foo.yml'

        expect(@post.same? other).to eql true
    end
  end

end
