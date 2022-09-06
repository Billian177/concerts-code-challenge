class Venue
    attr_accessor :title
    attr_reader :city
    @@all = []

    def initialize(title, city)
        @title = title
        @city = city
        @@all << self
    end

    def self.all
        @@all
    end

    def concerts
        Concert.all.filter{|concert| concert.venue==self}
    end
    
    def all_bands
        self.concerts.map{|concert| concert.band}
    end

    def bands
        self.all_bands.uniq
    end

    def concert_on(date)
        self.concerts.find{|concert| concert.date==date}
    end

    def most_frequent_band
        self.all_bands.tally.sort_by{|key,value| value}.last.first
    end
end