module Summary
    def self.summary weekmeals
        num = 0
        summary_array = []
        weekmeals[:days].each do |day|
            summary_individual = "On #{day} you will cook #{weekmeals[:meals][num]} and you will need to buy #{weekmeals[:ingredients][num]}."
            puts summary_individual
            summary_array << summary_individual
            num += 1
        end
    end 
end
