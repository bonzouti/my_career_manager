class StepsController < ApplicationController
    def new
        @step = Step.new
    end 
end
