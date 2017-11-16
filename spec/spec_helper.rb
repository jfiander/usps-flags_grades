require 'bundler/setup'
Bundler.setup
require 'simplecov'
SimpleCov.start

require 'usps_flags'
require 'usps_flags/grades'

# The spec for USPSFlags::Grades contains an example that checks for
# USPSFlags::Errors::InvalidGrade
RSpec::Expectations.configuration.on_potential_false_positives = :nothing

RSpec.configure do |config|
  config.before(:suite) do
    $tmp_flags_dir = "tmp/flags"

    USPSFlags.configure do |c|
      c.flags_dir = $tmp_flags_dir
    end
  end

  config.after(:suite) do
    ::FileUtils.rm_rf("tmp") if ::Dir.exist?("tmp")
  end
end
