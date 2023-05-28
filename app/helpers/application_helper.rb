module ApplicationHelper
    def full_name (user_id)
        first_name = User.find(user_id).first_name
        last_name = User.find(user_id).last_name
        first_name + " " + last_name
    end

end
