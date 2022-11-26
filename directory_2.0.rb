def input_students
  puts "Please, enter the name of the student"
  puts "To finish, just hit return twice"

  students = []

  name = gets.chomp

  while !name.empty? do
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    name = gets.chomp
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
  array.each_with_index do |hash, i|
    puts "#{i + 1} #{hash[:name]} (#{hash[:cohort]} cohort)"
  end
end

def print_footer(hash)
  print "Overall, we have #{hash.count} great students"
end

students = input_students
print_header
print_names(students)
print_footer(students)
