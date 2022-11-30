@students = []

def input_students
  puts "Please, enter the name of the student"
  puts "To finish, just hit return twice"

  name = gets.chomp

  while !name.empty? do
    @students << {name: name, cohort: :november}
    puts "Now we have #{@students.count} students"
    name = gets.chomp
  end
end

def interactive_menu
  loop do 
    print_menu
    process(gets.chomp)
  end 
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "9. Exit"
end

def show_students
  print_header
  print_student_list(@students)
  print_footer(@students)
end

def process(selection)
  case selection
  when "1"
    students = input_students
  when "2"
    show_students
  when "3"
    save_students
  when "9"
    exit
  else 
    puts "I don't kow what you mean, please try again"
  end
end

def print_header
  puts "The students of Villains Academy"
  puts "---------------------"
end

def print_student_list(array)
  array.each do |hash|
    puts "#{hash[:name]} (#{hash[:cohort]} cohort)"
  end
end

def print_footer(hash)
  puts "Overall, we have #{hash.count} great students"
end

def save_students
  # open a file for writing
  file = File.open("students.csv", "w")
  # iterate over the array of students 
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

interactive_menu