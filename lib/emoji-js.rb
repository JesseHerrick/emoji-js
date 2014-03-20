require "coffee-script"
require "fileutils"
require "uglifier"

module EmojiJS
  class Build
    def initialize(image_path)
      @image_path = image_path
    end

    public
    # takes CoffeeScript from 'vendor/coffee/emoji.coffee' and saves the corresponding JS to a variable
    def coffeescript
      puts vendor_dir
      
    end

    private
    def vendor_dir
      vendor_dir = File.dirname(File.expand_path(__FILE__, "../vendor"))
      raise "Vendor directory doesn't exist" unless File.directory? vendor_dir
    end
  end
end