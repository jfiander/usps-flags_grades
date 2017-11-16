require 'bundler/setup'
Bundler.setup
require 'simplecov'
SimpleCov.start

require 'usps_flags'
require 'usps_flags/burgees'

# The spec for USPSFlags::Burgees contains an example that checks for
# USPSFlags::Errors::UnknownBurgee
RSpec::Expectations.configuration.on_potential_false_positives = :nothing

RSpec.configure do |config|
  config.before(:suite) do
    $tmp_flags_dir = "tmp/flags"
    $tmp_burgees_dir = "tmp/path/to/burgees"

    USPSFlags.configure do |c|
      c.flags_dir = $tmp_flags_dir
      c.burgees_dir = $tmp_burgees_dir
    end
  end

  config.after(:suite) do
    ::FileUtils.rm_rf("tmp") if ::Dir.exist?("tmp")
    ::FileUtils.rm_rf(USPSFlags.configuration.burgees_dir) if ::Dir.exist?(USPSFlags.configuration.burgees_dir)
  end
end
