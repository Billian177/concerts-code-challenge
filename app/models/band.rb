class Band
    attr_accessor :name
    attr_reader :hometown
    @@all = []

    def initialize(name, hometown)
        @name = name
        @hometown = hometown
        @@all << self
    end

    def self.all
        @@all
    end

    def concerts
        Concert.all.filter{|concert| concert.band==self}
    end

    def venues
        self.concerts.map{|concert| concert.venue}.uniq
    end

    def play_in_venue(venue, date)
        Concert.new(date,self,venue)
    end

    def all_introductions
        self.concerts.map{|concert| concert.introduction}
    end
end