# frozen_string_literal: true

require 'minitest/autorun'

class Folder_traversalTest < Minitest::Test
  def setup
    # Do nothing
  end

  def teardown
    # Do nothing
  end

  def test
    assert Folder_traversal.new.traverse(".") != nil
    # skip 'Not implemented'
  end
end
