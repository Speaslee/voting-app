class VotesController<ApplicationController
    def index
        @votes = Vote.all
        @candidates = Candidate.all
    end
    def new
        if current_user.voted?
            redirect_to"/", notice: "You have already voted. Thanks!"
        end
        @candidates = Candidate.all
        @vote = Vote.new
    end
    def create
        if Vote.where(user_id: current_user.id).count < 1
            Vote.create(
                user_id: current_user.id,
                candidate_id:params[:vote][:candidate_id]
            )
            redirect_to "/", notice: "Vote recorded"
        else
            redirect_to "/", notice: "You have already voted"
        end
    end
end