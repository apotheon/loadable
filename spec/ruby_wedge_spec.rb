require 'helper'
require 'load/ruby'

describe "Ruby Wedge" do

  # setup alternate loadpath
  dir = File.expand_path(File.dirname(__FILE__) + '/fixture')

  before do
    $LOAD_PATH.unshift(dir)
  end

  after do
    $LOAD_PATH.delete(dir)
  end

  it "should load local library without the ruby prefix" do
    require 'abbrev'
    assert $NO_RUBY_WEDGE, "Local `abbrev.rb' library not loaded."
  end

  it "should load a standard ruby library with the from ruby option" do
    require 'abbrev', :from=>'ruby'
    assert Abbrev, "Ruby `abbrev.rb' library not loaded."
  end

end

