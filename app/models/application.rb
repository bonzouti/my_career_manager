class Application < ApplicationRecord
    after_create :scrap_job_description
    
    belongs_to :user
    
    has_many :steps
    has_many :contacts

    validates :company_name, presence: true
    validates :jobtitle, presence: true

    require 'openssl'
    require 'nokogiri'
    require 'open-uri'

    
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

        if self.joboffer_link.include?("https://www.jobteaser.com/fr/job-offers/")
            begin
            doc = Nokogiri::HTML(open(self.joboffer_link, :ssl_verify_mode => OpenSSL::SSL::VERIFY_NONE))
            @scrap = doc.css(".jt-Text--wysiwyg > *")
            rescue => error
            end

        elsif self.joboffer_link.include?("https://fr.linkedin.com/jobs/view")
            begin
            doc = Nokogiri::HTML(open(self.joboffer_link, :ssl_verify_mode => OpenSSL::SSL::VERIFY_NONE))
            @scrap = doc.xpath("/html/body/main/section[3]/div[1]/section[2]/div") 
            rescue => error
            end

        elsif self.joboffer_link.include?("https://www.welcometothejungle.co/companies/")
            begin
            doc = Nokogiri::HTML(open(self.joboffer_link, :ssl_verify_mode => OpenSSL::SSL::VERIFY_NONE))
            @scrap = doc.xpath("/html/body/div/div/main/section[2]/div/div/div") 
            rescue => error
            end                
        end

        self.joboffer_description = @scrap
        self.save
    end

end
