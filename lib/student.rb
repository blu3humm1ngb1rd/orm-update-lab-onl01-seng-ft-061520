require_relative "../config/environment.rb"

class Student

  attr_accessor :id, :name, :grade
  
  def initialize(id = nil, name, grade)
    @id = id 
    @name = name 
    @grade = grade
  end 

  def self.create_table 
    sql = <<-SQL
    CREATE TABLE IF NOT EXISTS students (
    id INTEGER PRIMARY KEY,
    name TEXT, 
    grade INTEGER 
    )
    SQL
    DB[:conn].execute(sql)
  end 
  
  def self.drop_table
    sql = <<-SQL
    DROP TABLE students 
    SQL
    DB[:conn].execute(sql)
  end 
  
  def save
    if self.id 
      self.update
    else 
    sql = <<-SQL
    INSERT INTO students (name, grade)
    VALUES (?, ?);
    SQL
    DB[:conn].execute(sql, self.name, self.grade)
    @id = DB[:conn].execute("SELECT MAX(ID) AS LastID FROM students")[0][0]
  end 
  end 
  
  def update 
     sql = <<-SQL
     UPDATE students 
     SET name = ?, grade = ?
     WHERE id = ?
     SQL
     
     DB[:conn].execute(sql, self.name, self.grade, self.id)
  end 
  
  def self.create(name, grade) 
    student = Student.new(name, grade)
    student.save
  end 
  
  def self.new_from_db(array)
    student = self.new 
    student.id = array[0]
    student.name = array [1]
    student.grade = array[2]
  end 
  
  
end
