@students = []

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "9. Exit"
end

def show_students
  print_header
  print_names(@students)
  print_footer(@students)
end

def interactive_menu
  loop do 
    print_menu
    selection = gets.chomp
    
    case selection
      when "1"
        students = input_students
      when "2"
        show_students
      when "9"
        exit
      else 
        puts "I don't kow what you mean, please try again"
    end
  end 
end

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

def print_header
  puts "The students of Villains Academy"
  puts "---------------------"
end

def print_names(array)
  array.each do |hash|
    puts "#{hash[:name]} (#{hash[:cohort]} cohort)"
  end
end

def print_footer(hash)
  puts "Overall, we have #{hash.count} great students"
end

interactive_menu