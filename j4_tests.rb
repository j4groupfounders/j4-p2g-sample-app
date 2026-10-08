require_relative "test/test_helper"
Minitest::Reporters.use! [Minitest::Reporters::JUnitReporter.new("Evidence/junit", false)]
Dir.glob("test/**/*_test.rb").sort.each { |f| require_relative f }
