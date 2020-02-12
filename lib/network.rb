class Network
  attr_reader :name,
              :shows
  def initialize(name)
    @name = name
    @shows = []
  end

  def add_show(show)
    @shows << show
  end

  def main_characters
    characters = []
    @shows.each do |show|
      show.characters.each do |character|
        if character.salary > 500_000 && character.name == character.name.upcase
          characters << character
        end
      end
    end
    characters
  end

  def actors_by_show
    @shows.reduce({}) do |show_actors, show|
      show_actors[show] = show.actors
      show_actors
    end
    # show_actors = {}
    # @shows.each do |show|
    #   show_actors[show] = show.actors
    # end
    # show_actors
  end

  def shows_by_actor
    # actor_shows = {}
    # @shows.each do |show|
    #   show.actors.each do |actor|
    #     actor_shows[actor] = [] if actor_shows[actor].nil?
    #     actor_shows[actor] << show
    #   end
    # end
    # actor_shows

    @shows.reduce({}) do |actor_shows, show|
      show.actors.each do |actor|
        actor_shows[actor] = [] if actor_shows[actor].nil?
        actor_shows[actor] << show
      end
      actor_shows
    end
  end

  def prolific_actors
    actors = []
    shows_by_actor.each do |actor, actor_shows|
      actors << actor if actor_shows.length > 1
    end
    actors
  end
end
