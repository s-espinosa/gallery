class Artist
  attr_reader :id,
              :name,
              :born,
              :died,
              :country

  def initialize(arguments)
    @name    = arguments[:name]
    @born    = arguments[:born]
    @died    = arguments[:died]
    @country = arguments[:country]
    @@all  ||= []
    @id      = @@all.count + 1
    @@all << self
  end

  def self.all
    @@all
  end

  def self.count
    @@all.count
  end
end
