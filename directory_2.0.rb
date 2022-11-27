def input_students

  students = []

  while true
    puts "Please, enter the name of the student"
    puts "To finish, just hit return twice"
    name = gets.chomp

    break if name.empty?

    puts "Please, enter the student's country of birth"
    country_of_birth = gets.chomp

    puts "Please, enter the student's hobby"
    hobby = gets.chomp

    puts "Please, enter the student's cohort"
    cohort = gets.chomp

    students.push({name: name, country_of_birth: country_of_birth, hobby: hobby, cohort: cohort})
    puts ("Now we have #{students.count} students").center(10)
  end

  students
end

# students = [
#   {name: "Doctor Hannibal Lecter", cohort: :november},
#   {name: "Darth Vader", cohort: :november},
#   {name: "Nurse Ratched", cohort: :november},
#   {name: "Michael Corleone", cohort: :november},
#   {name: "Alex DeLarge", cohort: :november},
#   {name: "The Wicked Witch of the West", cohort: :november},
#   {name: "Terminator", cohort: :november},
#   {name: "Freddy Krueger", cohort: :november},
#   {name: "The Joker", cohort: :november},
#   {name: "Joffrey Baratheon", cohort: :november},
#   {name: "Norman Bates", cohort: :november}
# ]

def print_header
  puts "The students of Villains Academy"
  puts "---------------------"
end

def print_names(array)
  puts "Which letter would you like to search for?"
  letter = gets.chomp.downcase

  array.each_with_index do |hash, i|
    name_first_letter = (hash[:name])[0].downcase

    if hash[:name].length < 12
      if letter == name_first_letter
        puts "#{i + 1} #{(hash[:name]).capitalize}, country of birth: #{(hash[:country_of_birth].capitalize)} (#{hash[:cohort]} cohort)"
      end

      if letter.empty?
        puts "#{i + 1} #{(hash[:name]).capitalize}, country of birth: #{(hash[:country_of_birth].capitalize)} (#{hash[:cohort]} cohort)"
      end
    end
  end
end

def print_footer(hash)
  print "Overall, we have #{hash.count} great students"
end

students = input_students
print_header
print_names(students)
print_footer(students)
