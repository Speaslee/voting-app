require "test_helper"

class VoteTest < ActiveSupport::TestCase
  def setup
    candidate = Candidate.create(name: "New Candidate")
    user = User.create(email: "user2@example.com", zipcode: 12345)
    @vote = Vote.new(candidate_id: candidate.id, user_id: user.id)
  end
  test "create vote" do
    @vote.save!
    assert_equal @vote.save!, true
  end
end