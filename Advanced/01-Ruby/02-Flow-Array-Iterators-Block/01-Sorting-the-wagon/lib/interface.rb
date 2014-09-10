require_relative "wagon_sort"

students = []

begin
  puts students.empty? ? "Type a student name:" : "Type another student name (or press enter to finish):"
  name = gets
  name.chomp! if name

  # TODO: Add the name we just gotto the students array
  students << name

end while name != ""

# Remove the last (empty) element
students.delete_at(students.length - 1)

# TODO: Call `wagon_sort` method and display the sorted student list
sorted_students = wagon_sort(students)

puts "Congratulations! Your Wagon has #{sorted_students.length} students:" + "\n" +
"- #{sorted_students[0...sorted_students.length - 1].join(', ')} " +
"and #{sorted_students[sorted_students.length - 1]}"
