class Genre < ActiveRecord::Base
  has_many :songs
  has_many :artists, through: :songs

  def song_count
    self.songs.count
  end

  def artist_count
    self.songs.collect do |song|
      song.artist
    end.uniq.count
    # return the number of artists associated with the genre
  end

  def all_artist_names
    self.songs.collect do |song|
      song.artist.name
    end
    # return an array of strings containing every musician's name
  end
end
