require 'yaml'
class Post
    attr_accessor :title, :text, :date, :user
    def initialize(title, text = nil, date = nil, user = nil)
        file_path = nil
        if title and !text and !date and !user
            # NOTE: Duck-typing a lá JavaScript.
            file_path = title
        end
        if file_path
            p = YAML::load file_path

            title = p.title
            text = p.text
            date = p.date
            user = p.user
        end

        @title = title
        @text = text
        @date = date
        @user = user
    end
    def save
        File::open 'my-post.yml', 'w' do |f|
            f.write YAML::dump self
        end
    end
end
