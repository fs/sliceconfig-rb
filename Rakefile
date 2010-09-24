$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), 'lib'))

require 'rake'
require 'sliceconfig'

namespace :install do
  desc 'Install base stack'
  task :base do
    Sliceconfig::Stack.install(:base)
  end
end