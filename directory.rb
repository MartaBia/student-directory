@students = []

def input_students
  print_input_students_header

  name = STDIN.gets.chomp

  while !name.empty? do
    adding_students_to_array({name: name, cohort: :november.to_sym})
    puts "Now we have #{@students.count} students"
    name = STDIN.gets.chomp
  end
end

def interactive_menu
  loop do 
    print_menu
    process(STDIN.gets.chomp)
  end 
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. load the list from students.csv"
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
    puts "Students added succesfully!"
  when "2"
    show_students
  when "3"
    save_students
    puts "Student saved succesfully!"
  when "4"
    puts "Type file's name"
    load_students
    puts "Student loaded succesfully!"
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

def print_input_students_header
  puts "Please, enter the name of the student"
  puts "To finish, just hit return twice"
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
  puts "Type the file's name"
  file = File.open("#{STDIN.gets.chomp}.csv", "w") do |f|
    f.write 
   
    @students.each do |student|
      student_data = [student[:name], student[:cohort]]
      csv_line = student_data.join(",")
      f.puts csv_line
    end
  end

  # -- FIRST VERSION: -------
  # file = File.open("#{STDIN.gets.chomp}.csv", "w")
  # @students.each do |student|
  #   student_data = [student[:name], student[:cohort]]
  #   csv_line = student_data.join(",")
  #   file.puts csv_line
  # end
  # file.close
end

def load_students(filename = "#{STDIN.gets.chomp}.csv") #this is a default value, if no argument is passed then the value "students.csv" will be used instead
  
  file = File.open(filename, "r") do |f|
          f.readlines.each do |line|
            name, cohort = line.chomp.split(',')
            adding_students_to_array({name: name, cohort: cohort.to_sym})
          end
        end

  # -- FIRST VERSION: -------      
  # file = File.open(filename, "r")
  # file.readlines.each do |line|
  #   name, cohort = line.chomp.split(',')
  #   adding_students_to_array({name: name, cohort: cohort.to_sym})
  # end
  # file.close
end

def adding_students_to_array(hash)
  @students.push(hash)
end

def try_load_students
  filename = ARGV.first #first argument from the command line
  return if filename.nil? #get out of the method if it isn't given
  if File.exist?(filename) #if it's given and it exists
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else #if it doesn't exist
    puts "Sorry, #{filename} does not exists."
    exit
  end
end

interactive_menu