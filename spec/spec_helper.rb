require 'rspec'
require 'puppet'
require 'rspec-puppet'
require 'mocha'

PROJECT_ROOT = File.expand_path('..', File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(PROJECT_ROOT, "lib"))

# ---
# Load all shared contexts
require File.join(PROJECT_ROOT, 'spec', 'helpers', 'platform_helpers.rb')
Dir.glob(File.join(PROJECT_ROOT, 'spec', 'shared_contexts', '*')).each do |context|
  require context
end

fixture_path = File.expand_path(File.join('spec', 'fixtures'), PROJECT_ROOT)

RSpec.configure do |config|
  config.mock_with :mocha

  config.module_path = File.join(fixture_path, 'modules')
  config.manifest_dir = File.join(fixture_path, 'manifests')
end

# ---
# Add the fixture module libdirs to the modulepath

$LOAD_PATH.concat(Dir.glob(File.join(fixture_path, 'modules', '*', 'lib')))
