require 'rubygems'
require 'middleman-core/load_paths'

::Middleman.setup_load_paths

require 'middleman-core'
require 'middleman-core/preview_server'

class ::Middleman::PreviewServer
  def self.preview_in_rack
    begin
      @options = { latency: 0.25 }
      @app = new_app
    rescue NoMethodError => e
      puts e.message
    end

    start_file_watcher
  end
end

::Middleman::PreviewServer.preview_in_rack
run ::Middleman::PreviewServer.app.class.to_rack_app
