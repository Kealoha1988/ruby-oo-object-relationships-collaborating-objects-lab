class Artist
    attr_accessor :name
    attr_writer :songs

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def Artist.all
        @@all
    end

    def songs
        Song.all.select{|song| song.artist == self}
    end
 

    def add_song(song)
        song.artist = self
    end

def self.find_or_create_by_name(name)
    self.all.detect{|artist| artist.name == name} || Artist.new(name)
end

def print_songs
    Song.all.each{|song| puts song.name if song.artist == self}
end

end