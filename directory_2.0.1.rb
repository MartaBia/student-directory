@students = []

def input_students
  print_input_students_header  
  name = STDIN.gets.chomp

  while !name.empty? do
    @students.push({
      name: name.capitalize, 
      country_of_birth: enter_student_details("country of birth"), 
      cohort: enter_student_details("cohort")
    })

    if @students.length == 1
        puts "Now we have 1 student"
      else
        puts "Now we have #{@students.count} students"
    end

    print_input_students_header
    name = STDIN.gets.chomp
  end
end

def enter_student_details(string)
  puts "Please, enter the student's #{string}"
  value = gets.chomp
  if value.empty?
    value = "*value not inserted*"
  end
  value.capitalize
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
  # puts "4. load the list from students.csv"
  puts "9. Exit"
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
    # when "4"
    #   load_students
    #   puts "Student loaded succesfully!"
    when "9"
      exit
    else 
      puts "I don't kow what you mean, please try again"
    end
  end

def print_header
  puts "The students of Villains Academy"
  puts "---------------------".center(30)
end

def print_input_students_header
  puts "*********************".center(30)
  puts "Please, enter the name of the student"
  puts "To finish, just hit return twice" 
end

def show_students
    print_header
    print_student_list(@students)
    print_footer(@students)
  end

def print_student_list(array)
  array.each do |hash|
    puts "#{hash[:name]} (#{hash[:cohort]} cohort)"
  end
end

def print_footer(array)
    puts "---------------------".center(30)

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

def save_students
  puts "Type the file's name"
  file = File.open("#{STDIN.gets.chomp}.csv", "w") do |f|
    f.write 
   
    @students.each do |student|
      student_data = [student[:name], student[:country_of_birth], student[:cohort]]
      csv_line = student_data.join(",")
      f.puts csv_line
    end
  end
end

def load_students(filename = "students.csv")
  file = File.open(filename, "r") do |f|
    f.readlines.each do |line|
      name, country_of_birth, cohort = line.chomp.split(',')
      @students.push({
        name: name, 
        country_of_birth: country_of_birth, 
        cohort: cohort
      })
    end
  end
end

def try_load_students
  filename = ARGV.first
  return if filename.nil?
  if File.exist?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else 
    puts "Sorry, #{filename} does not exists."
    exit
  end
end

load_students
interactive_menu