require "test_helper"

class CandidateTest < ActiveSupport::TestCase
  def setup
    @candidate = Candidate.new(name: "New Candidate")
  end
  test "create candidate" do
    @candidate.save!
    assert_equal @candidate.save!, true
  end
  
end