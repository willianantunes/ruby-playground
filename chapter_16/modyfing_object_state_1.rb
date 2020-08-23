class Grade
  attr_reader :letter

  def calculate_grade(scores)
    case scores.sum / scores.size
    when 90..100
      @letter = "A"
    when 80...90
      @letter = "B"
    when 70...80
      @letter = "C"
    when 60...70
      @letter = "D"
    else
      @letter = "F"
    end
  end
end

class ReportCard

  def initialize(name, physics_grade, chemistry_grade, biology_grade)
    @name = name
    @physics_grade = physics_grade
    @chemistry_grade = chemistry_grade
    @biology_grade = biology_grade
  end

  def issue
    puts "Report Card for #{@name}"
    puts
    puts "Physics: #{@physics_grade.letter}"
    puts "Chemistry: #{@chemistry_grade.letter}"
    puts "Biology: #{@biology_grade.letter}"
  end
end

physics_grade = Grade.new
physics_grade.calculate_grade([78, 92, 90])
chemistry_grade = Grade.new
chemistry_grade.calculate_grade([90, 80, 88])
biology_grade = Grade.new
biology_grade.calculate_grade([99, 90, 98])
rc = ReportCard.new("Jafar", physics_grade, chemistry_grade, biology_grade)
rc.issue

# Report Card for Jafar
#
# Physics: B
# Chemistry: B
# Biology: A

puts "#########"

# The Grade object maintains state—the letter grade for a set of numerical scores
# ReportCard depends on this state both to maintain its own state and to issue its output
# In this case we might mitigate some of the risk by removing some state from our objects.
# Let’s implement Grade and ReportCard without any instance variables

class Grade
  def self.calculate(scores)
    case scores.sum / scores.size
    when 90..100
      "A"
    when 80...90
      "B"
    when 70...80
      "C"
    when 60...70
      "D"
    else
      "F"
    end
  end
end

class ReportCard
  def self.issue(name, physics_grade, chemistry_grade, biology_grade)
    puts "Report Card for #{name}"
    puts
    puts "Physics: #{physics_grade}"
    puts "Chemistry: #{chemistry_grade}"
    puts "Biology: #{biology_grade}"
  end
end

physics_grade = Grade.calculate([78, 92, 90])
chemistry_grade = Grade.calculate([90, 80, 88])
biology_grade = Grade.calculate([99,90,98])
ReportCard.issue("Iago", physics_grade, chemistry_grade, biology_grade)

# Report Card for Iago
#
# Physics: B
# Chemistry: B
# Biology: A
