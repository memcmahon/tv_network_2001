class Show
  attr_reader :name,
              :creator,
              :characters

  def initialize(name, creator, characters)
    @name = name
    @creator = creator
    @characters = characters
  end

  def actors
    @characters.map do |character|
      character.actor
    end
  end

  def total_salary
    # salary = 0
    # @characters.each do |character|
    #   salary += character.salary
    # end
    # salary
    #
    # @characters.reduce(0) do |total_salary, character|
    #   total_salary += character.salary
    # end

    @characters.sum { |character| character.salary }

    # @characters.sum(&:salary)
  end

  def highest_paid_actor
    # most_expensive_character = nil
    # @characters.each do |character|
    #   most_expensive_character = character if most_expensive_character.nil?
    #   if most_expensive_character.salary < character.salary
    #     most_expensive_character = character
    #   end
    # end
    # most_expensive_character.actor

    @characters.max_by do |character|
      character.salary
    end.actor

    # @characters.max_by(&:salary).actor
  end
end
