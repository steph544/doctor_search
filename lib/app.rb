
$prompt = TTY::Prompt.new

def start
    p "Welcome to DocSearch app!"
    search_requirement 
end 

def search_requirement
    input= $prompt.select('How would you like to search for your doctor?') do |menu|
    menu.choice 'Zip Code', 1
    menu.choice 'Specialty', 2
    menu.choice 'Doctor Name', 3
    end 
    if input == 1
    search_zip_code 
    elsif input == 2
    search_specialty 
    elsif input == 3
    search_doctor_name 
    end 
end 

def search_zip_code
    zip_code_input= $prompt.ask("Please enter your zip code.")
    p "The following doctors are located in your zip code. Please choose a doctor to continue:"
    # # doctor = Doctor.where(address: zip_code_input)
    # save_doctor(doctor)
end 

def search_doctor_name 
    input = $prompt.ask("What is the doctor's name?")
    if !Doctor.all.include?(input)
        input = $prompt.select("Sorry, there were no matches for this doctor's name. Would you like to search again?") do |menu|
            menu.choice 'Yes'
            menu.choice 'No'
        end 
        if input == 1
            search_requirement 
        elsif input == 2
            task_menu
        end 
    elsif Doctor.all.include?(input)
    p "Here are doctors that match your search. Please choose a doctor to continue:"
    # # p Doctor.where(name: input.strip)
    # save_doctor(doctor)
    end 
end 

def save_doctor(doctor)
    input = $prompt.select ("Would you like to save this doctor to your favorite's list?") do |menu|
        menu.choice 'Yes', 1
        menu.choice 'No', 2
    end 
    if input == 1
        p "Your doctor has been added to your favorite's list."
        # save_to_favs_list(user, doctor) 
        input2 = $prompt.select ("What would you like to do next?") do |menu|
            menu.choice 'See my favorite list?', 1
            menu.choice 'Search for another doctor', 2
        end 
        if input2== 1
            see_favorite_list 
        elsif input2 == 2
            search_requirement 
        end 
    elsif input == 2 
        no_more=$prompt.select ("No problem! Would you like to search for another doctor?") do |menu|
            menu.choice 'Yes', 1
            menu.choice 'No', 2
        end 
        if no_more == 1
            search_requirement 
        elsif no_more == 2
            p "Thank you for using DocSearch app!"
        end 
    end 
end 

def search_specialty
    specialty_input= $prompt.select("What specialty would you like to search for?") do |menu|
        menu.choice 'Pediatrics', 1
        menu.choice 'Internal', 2
        menu.choice 'General', 3
    end 
    if specialty_input == 1
        # pediatrics= Specialty.find_by(name: "Pediatrics")
        # puts Doctor.where(speciality_id: pediatrics.id)
        # save_doctor(doctor)
    elsif specialty_input == 2
        # internal= Specialty.find_by(name: "Internal")
        # puts Doctor.where(speciality_id: internal.id)
    elsif specialty_input == 3 
        # general= Specialty.find_by(name: "General")
        # puts Doctor.where(speciality_id: general.id)
    end 
end 

def save_to_favs_list(user, doctor)
    if Favs_list.all.include?(user)
        user.favs_list << doctor 
    else
        Favs_list.create(user_id: user, doctor_id: doctor)
        p "A new favorite's list has been created for you."
        input= $prompt.select do |menu|
            menu.choice "View Favorite's List", 1
            menu.choice "Search for another Doctor", 2
            menu.choice "Exit the app", 3 
        end 
        if input == 1 
            see_favorite_list 
        elsif input == 2
            search_requirement 
        elsif input == 3 
            p "Thank you for using DocSearch app!"
        end
    end  
end 

def see_favorite_list(user)
    #show list and then give option to close list and search again
    p"|----------------------------------------------------------------------------|"
    p"|------------------------- user's favorite's list----------------------------|"
    p"|----------------------------------------------------------------------------|"
    p"|#{user.favs_list.first}                                                     |"
    p"|#{user.favs_list.second}                                                    |"
    p"|#{user.favs_list.find(3)}                                                   |"
    p"------------------------------------------------------------------------------"
    input= $prompt.select("What would you like to do next?") do |menu|
        menu.choice "See a Doctor's information", 1
        menu.choice "Search for another Doctor", 2
        menu.choice "Exit the app", 3 
        end 
        if input == 1 
            input2=$prompt.select("Please choose a Doctor.") do |menu|
                menu.choice "#{user.favs_list.first.name}", 1
                menu.choice "#{user.favs_list.second.name}", 2
                menu.choice "#{user.favs_list.find(3).name}", 3
            end 
            # if input2==1 
            #     p "Doctor's Name:"
            #     p "Address:"
            #     p "Phone Number:"
            #     p "Specialty"
            # elsif input2==2
            #     p "Doctor's Name:"
            #     p "Address:"
            #     p "Phone Number:"
            #     p "Specialty"
            # elsif input2==3 
            #     p "Doctor's Name:"
            #     p "Address:"
            #     p "Phone Number:"
            #     p "Specialty"
            # end 
        elsif input == 2
            search_requirement 
        elsif input == 3 
            p "Thank you for using DocSearch app!"
        end
end 

def task_menu 
    input= $prompt.select("What would you like to do next?") do |menu|
        menu.choice "View Favorite's List", 1
        menu.choice "Search for another Doctor", 2
        menu.choice "Exit the app", 3 
        end 
        if input == 1 
            see_favorite_list 
        elsif input == 2
            search_requirement 
        elsif input == 3 
            p "Thank you for using DocSearch app!"
        end
end 






# 1. Create User or Check if User exists
#     -If exists, return user name 
#     -load favs_list
#         -all them to add new favorite doctors 
#     -If not, then create new user 
#         -Begin searching for doctors

# 2. Search 
#     -Search by location, or specialty 
#     -Search database based on what user chooses 
#     -return all the matches 

# 3. After searching, user will choose one to update, delete, or add to list. 

# 4. Would you like to search for more options or save your favs list? 

# 5. If save, save the favs list and say "Your list has been saved. Thank you for searching" or else exit "Thanks for searching."


