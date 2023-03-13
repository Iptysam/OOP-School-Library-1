# frozen_string_literal: true

# person class store person information and properties
class Person
  attr_accessor :name, :age
  attr_reader :id

  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = generate_id
    @age = age
    @name = name
    @parent_permission = parent_permission
  end

  def display_info
    { 'id' => @id, 'name' => @name, 'age' => @age }
  end

  def update_info(name, age)
    @name = name
    @age = age
  end

  def can_use_services
    if of_age || @parent_permission
      true
    elsif !of_age || !@parent_permission
      false
    end
  end

  private

  def of_age
    @age.to_i >= 18
  end

  def generate_id
    rand(1..100)
  end
end
