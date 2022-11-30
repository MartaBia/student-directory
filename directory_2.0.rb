
def input_students

  students = []

  while true
    puts "*********************".center(30)
    puts "Please, enter the name of the student"
    puts "To finish, just hit return twice"
    name = gets.chomp
      
    break if name.empty?
    
    #-- TODO: ask the user for the kind of cathegory e.g. "which cathegory do you want? (DOB, hobby, cohort)" 
    puts "Please, enter the student's country of birth"
    country_of_birth = gets.chomp
    if country_of_birth.empty?
      country_of_birth = "*value not inserted*"
    end

    puts "Please, enter the student's cohort"
    cohort = gets.chomp
    if cohort.empty?
      cohort = "* value not inserted *"
    end

    students.push({name: name, country_of_birth: country_of_birth, cohort: cohort})

    if students.length == 1
      puts "Now we have 1 student"
    else
      puts "Now we have #{students.count} students"
    end
  end

  students
end

def print_header
  puts "The students of Villains Academy"
  puts "---------------------".center(30)
end

def print_names(array)
  if !array.empty?
    puts "Would you like to search names for a specific letter?"
    puts "Write 'Yes' if you would, otherwise just hit return"
    letter_search_answer = gets.chomp.downcase

    if letter_search_answer == "yes"
      puts "Which letter would you like to search for?"
      letter = gets.chomp.downcase
    end

    array.each_with_index do |hash, i|
      name_first_letter = (hash[:name])[0].downcase

    
      if letter == name_first_letter
        puts "- #{(hash[:name]).capitalize}, country of birth: #{(hash[:country_of_birth].capitalize)} (#{hash[:cohort].capitalize} cohort)"
        
      end
      if letter_search_answer.empty?
        puts "#{i + 1} #{(hash[:name]).capitalize}, country of birth: #{(hash[:country_of_birth].capitalize)} (#{hash[:cohort].capitalize} cohort)"
      end
    end
  end
end

def print_footer(array)
  if array.empty?
    puts "No students here"
  else
    if array.length == 1
      puts "We only have 1 (but great) student"
    else
      puts "Overall, we have #{array.count} great students"
    end
  end
end

students = input_students
print_header
print_names(students)
print_footer(students)
