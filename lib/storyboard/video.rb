module Storyboard
  class Video
    attr_accessor :parent, :path, :raw_data
    attr_accessor :height, :width, :framerate, :duration
    
    def initialize(parent)
      @parent = parent
      @path = File.expand_path(parent.options['_video'])

      run_basic_probe
      parent.ui.log("#{File.basename(@path)} is #{@width}x#{@height}", Logger::DEBUG)
    end

    private
    def run_basic_probe
      @raw_data = JSON.parse(Storyboard::Binaries.ffprobe("-v", "quiet", "-of", "json", "-show_streams", "-show_format", @path))
      @duration = @raw_data['format']['duration'].to_f

      video = @raw_data['streams'].detect {|s| s['codec_type'] == 'video' }
      @height = video['height'].to_i
      @width = video['width'].to_i
      @framerate = video['r_frame_rate']
    end
  end
end