class Student
  def method_missing(m, *args)
    if m.to_s.start_with?("grade_for_")
      puts "You got an A in #{m.to_s.split("_").last.capitalize}!"
    else
      super
    end
  end
end

a = Student.new
a.grade_for_english # You got an A in English!
a.calopsita # undefined method `calopsita' for #<Student:0x00007f88178b5820> (NoMethodError)