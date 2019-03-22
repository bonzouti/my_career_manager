class Application < ApplicationRecord
    after_create :scrap_job_description
    
    belongs_to :user
    
    has_many :steps
    has_many :contacts

    validates :company_name, presence: true
    validates :jobtitle, presence: true

    
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
            if applied_steps = 0
                self.status = "identified"
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
        @next_steps = self.steps.to_a.select {|x| x.status == false}
        if @next_steps.count == 0
            return true
        else
            return false
        end
        
    end

    def has_no_joboffer_details
        if (self.joboffer_description == "" && self.joboffer_link == "")
            return true
        else
            return false
        end
    end

    def scrap_job_description
        puts "*************************************************************start scrapping"
        require 'openssl'
        require 'nokogiri'
        require 'open-uri'

        
        if self.joboffer_link.include?("https://www.jobteaser.com/fr/job-offers/")
            puts "*************************************************************INCLUDED"
            doc = Nokogiri::HTML(open(self.joboffer_link, :ssl_verify_mode => OpenSSL::SSL::VERIFY_NONE))
            @scrap = doc.css(".jt-Text--wysiwyg > *")
        end

        self.joboffer_description = @scrap
        puts "*********************************************SCRAP"
        puts @scrap
        self.save
        puts "*****************************************************************end scrapping"
    end

end
