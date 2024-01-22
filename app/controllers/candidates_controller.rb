class CandidatesController<ApplicationController
    MAX_CANDIDATE = 10
    def create
        candidate_exists = Candidate.where( name: params[:candidate][:name])
        if candidate_exists.any?
            @vote = Vote.new(candidate: candidate_exists.first, user: current_user)
                if @vote.save!
                    notice_message = "Thank you for voting for #{candidate_exists.name}"
            
                else
                    notice_message "Problem recording your vote, please try again"
                end
        
        elsif Candidate.all.count < MAX_CANDIDATE
            @candidate = Candidate.new(
                name: params[:candidate][:name]
            )
    
            if @candidate.save!
                @vote = Vote.new(candidate: @candidate, user: current_user)
                if @vote.save!
                    notice_message =  "Thank you for voting for #{@candidate.name}"
            
                else
                    notice_message =  "Problem recording your vote, please try again"
                end
            else
                notice_message = "Problem recording your candidate, please try again"

            end
        end

        redirect_to "/", notice: notice_message
    end
end