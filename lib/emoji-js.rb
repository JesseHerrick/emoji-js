require "coffee-script"
require "fileutils"
require "uglifier"

module EmojiJS
  class Generate
    def initialize(project_path = Dir.pwd)
      @project_path = project_path
      @path = File.dirname File.expand_path(__FILE__)
      @vendor_path = "#{@path}/vendor"
    end

    public
    # takes CoffeeScript from 'vendor/coffee/emoji.coffee' and saves the corresponding JS to a variable
    def coffeescript
      @coffee_path = "#{@vendor_path}/coffee"

      # get image path
      print 'Emoji image path: (default: "/graphics/") '
      @image_path = gets.chomp
      @image_path = "/graphics/" if @image_path.empty?

      # coffee_grounds = modified coffescript
      @coffee_grounds = replace_in_file("#{@coffee_path/emoji.coffee}", %q{Emoji.image_path = "/graphics/" # customize to your liking}, "Emoji.image_path = \"#{@image_path}\"")

      @generated_js = CoffeeScript.compile(coffee_grounds)
      @ugly_js = uglify @generated_js

      # get js dir
      print %q{Your project's JavaScript directory: (default: "js/") }
      js_dir = gets.chomp
      js_dir = "js" if js_dir.empty?

      # write emoji.min.js
      FileUtils.cd("#{@project_path}/js_dir")
      write_to_file "emoji.min.js", @uglify
      FileUtils.cd("../")
    end

    # takes raw JS and uglifies it
    def uglify(js)
      Uglifier.compile(js)
    end

    # copy emoji images to image path
    def emoji_images
      puts "Using emoji image path: '#{@image_path}'"
      FileUtils.mkdir(@image_path)

      @image_path = validate_image_path(@image_path)
      @emojis = Dir.glob("#{@vendor_path}/graphics/*").map(&File.method(:realpath))

      FileUtils.cp(@emojis, @image_path)
    end

    private
    # replace something for something else in a string
    def replace_in_file(file, search, replace)
      string = File.read(file)
      string.sub(search, replace)
    end

    # write content to a file
    def write_to_file(filename, content)
      File.open(filename, "w") do |file|
        file.write(content)
      end
    end

    # make emoji image path valid
    def validate_image_path(path)
      path = "/#{path}" unless path[0] == "/"
      path = @project_path + path
      raise "Not a real path" if File.directory? path
    end
  end
end