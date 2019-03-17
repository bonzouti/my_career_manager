class Application < ApplicationRecord
    belongs_to :user
    
    has_many :steps
    has_many :contacts
    
    def archive
        @application = Application.find(params[:id])
        @application.status = "archived"
        if @application.save
            redirect_to root_path
        end
    end

    def update_status
        progress_steps = 0
        applied_steps = 0
        if self.status != "archived"
            self.steps.each do |step|
                if step.category == "phone interview" || step.category == "interview"
                    progress_steps =+1
                end
                if step.category == "application sent"
                    applied_steps =+1
                end
            end
            if applied_steps > 0
                self.status = "applied"
            end
            if progress_steps > 0
                self.status = "in_progress"
            end
        end
        self.save
    end

    def has_no_next_step
        @next_steps = []
        self.steps.each do |step|
          if step.date != nil
            if step.date > Date.today
              @next_steps << step
            end
          end
        end 
        if @next_steps.count == 0
            return true
        end
    end

    def has_no_joboffer_details
        if (self.joboffer_description == "" && self.joboffer_link == "")
            return true
        else
            return false
        end
    end

end
