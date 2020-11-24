class Song
    attr_accessor :name, :artist
    attr_writer :songs

    @@all = []


    def initialize(name)
        @name = name
        @songs = []
        @@all << self
    end

    def self.new_by_filename(filename)
        news = filename.split(" - ")
        song = self.new(news[1])
        artist = Artist.find_or_create_by_name(news[0])
        song.artist = artist
        artist.add_song(song)
        song
    end

    def self.all
        @@all
    end

    def artist_name=(name)
        self.artist = Artist.find_or_create_by_name(name)
        artist.add_song(self)
    end

end