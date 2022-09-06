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
        Concert.all.filter do |concert| 
            concert.venue==self
        end
    end
    
    def bands
        self.concerts.map do |band|
            band.band
        end
    end

    def concert_on(date)
        self.concerts.find do |concert|
         concert.date==date
        end
    end

    def most_frequent_band
        self.all_bands.tally.sort_by{|key,value| value}.last.first
    end
end