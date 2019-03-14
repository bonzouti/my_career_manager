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
end
