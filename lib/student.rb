require_relative "../config/environment.rb"

class Student

  attr_accessor :id, :name, :grade
  
  def initialize(id = nil, name, grade)
    @id = id 
    @name = name 
    @grade = grade
  end 

  def self.create_table 
    
  end 
  
  def self.drop_table
    
  end 
  
  def save
    
  end 
  
  def self.create 
    
  end 
  
  def self.new_from_db
    
  end 
end
