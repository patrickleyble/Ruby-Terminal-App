require 'mail'

module Send_email
    def self.send_email(weekmeals)
            print "Please enter your email address: "
            email_address = gets.chomp.downcase
            time_stamp = Time.now
            num = 0
            final_summary = []
            weekmeals[:days].each do |day|
                summary_individual = "On #{day} you will cook #{weekmeals[:meals][num]} and you will need to buy #{weekmeals[:ingredients][num]}."
                final_summary << summary_individual
                num += 1
            end
        
        mail = Mail.new do
            from     "grasela.eryk@gamil.com"
            to       "#{email_address}"
            subject  "#{time_stamp}Your dinner plan with shopping list"
            body     " #{final_summary[0]}\n\n #{final_summary[1]}\n\n #{final_summary[2]}\n\n #{final_summary[3]}\n\n #{final_summary[4]}\n\n \n\n Your shopping list:\n #{weekmeals[:ingredients][0]} #{weekmeals[:ingredients][1]} #{weekmeals[:ingredients][2]} #{weekmeals[:ingredients][3]} #{weekmeals[:ingredients][4]} "
        end
        mail.delivery_method :sendmail
        mail.deliver
    end
end