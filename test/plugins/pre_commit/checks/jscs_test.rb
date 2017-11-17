=begin
Copyright 2016 Eric Agnew eric@bradsdeals.com

See the file LICENSE for copying permission.
=end

require 'minitest_helper'
require 'plugins/pre_commit/checks/jscs'

class TestConfig
  def get(arg); end
end

describe PreCommit::Checks::Jscs do
  let(:check) do
    config = TestConfig.new
    PreCommit::Checks::Jscs.new(nil, config, [])
  end

  it "does nothing" do
    check.call([]).must_equal(nil)
  end

  it "returns nothing if the file has no errors" do
    check.call([fixture_file("file.js")]).must_equal(nil)
  end

  it "returns jscs errors if the file contains errors" do
    check.call([fixture_file("bad-file.js")]).must_match(/requireSemicolons/i)
    check.call([fixture_file("bad-file.js")]).must_match(/disallowMultipleVarDecl/i)
    check.call([fixture_file("bad-file.js")]).must_match(/disallowSpaceAfterObjectKeys/i)
    check.call([fixture_file("bad-file.js")]).must_match(/validateQuoteMarks/i)
  end
end
