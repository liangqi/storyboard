require 'json'
require 'prawn'
require 'logger'
require 'tmpdir'
require 'tempfile'
require 'shellwords'

module Storyboard
  autoload :VERSION,              "storyboard/version"
  autoload :CLI,                  "storyboard/cli"

  autoload :Binaries,             "storyboard/binaries"
  autoload :Video,                "storyboard/video"

  module Extractor
    autoload :Base,               "storyboard/extractors/base.rb"
    autoload :Points,             "storyboard/extractors/points.rb"
    autoload :Range,              "storyboard/extractors/range.rb"
  end

  module Builder
    autoload :GIF,                "storyboard/builder/gif.rb"
    autoload :PDF,                "storyboard/builder/pdf.rb"
  end

  autoload :Subtitles,            "storyboard/subtitles.rb"
  class Subtitles
    module Source
      autoload :Text,             "storyboard/subtitles/sources/text.rb"
      autoload :Local,            "storyboard/subtitles/sources/local.rb"
      autoload :Path,             "storyboard/subtitles/sources/path.rb"
      autoload :Web,              "storyboard/subtitles/sources/web.rb"
    end
    module Filter
      autoload :Text,             "storyboard/subtitles/filters/text.rb"
      autoload :Time,             "storyboard/subtitles/filters/time.rb"
    end

  end

  module Runners
    autoload :Base,               "storyboard/runners/base.rb"
    autoload :Book,               "storyboard/runners/book.rb"
    autoload :Gif,                "storyboard/runners/gif.rb"
    autoload :Movie,              "storyboard/runners/movie.rb"
  end

  module UI
    autoload :Console,            "storyboard/ui/console.rb"
  end  
end
