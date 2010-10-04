require 'json'
require 'tmpdir'
require 'rest_client'

module Sliceconfig
  class Runner
    def self.run
      new.run
    end

    def run
      system('rm -rf ~/.sliceconfig')
      system("chef-solo -c #{config}")
      exit($?.to_i)
    end

    def config
      download_solo_rb
      filename
    end

    private

    def download_solo_rb
      response = RestClient.get("http://github.com/fs/sliceconfig-rb/raw/v#{::Sliceconfig::VERSION::STRING}/bootstrap/sliceconfig.rb")
      if response.code == 200
        File.open(filename, 'w') do |fp|
          fp.write(response.body)
        end
      end
    end

    def filename
      @filename ||= File.expand_path(File.join(Dir.tmpdir, 'sliceconfig.rb'))
    end
  end
end