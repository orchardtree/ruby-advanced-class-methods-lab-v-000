require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  
  def self.create
    song = self.new
    self.all << song
    song
  end
  
  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end
  
  def self.create_by_name(name)
    song = self.new_by_name(name)
    self.all << song
    song
  end
  
  def self.find_by_name(name)
    song = self.all.find{|song| song.name == name}
    if song != nil 
      song 
    else
      false
    end
  end

  def self.find_or_create_by_name(name)
    song_found = self.find_by_name(name)
    create_song = self.create_by_name(name)
    if song_found == false
      create_song
    else
      song_found
    end
  end
  
  def self.alphabetical
    @@all.sort_by!{|song| song.name}
  end
  
  def self.new_from_filename(filename)
    parsed_filename_ary = filename.split(/[-\.]/)
    song = self.new
    song.name = parsed_filename_ary[0].chomp
    song.artist_name = parsed_filename_ary[1].chomp
    song
  end
  
  def self.create_from_filename 
  end
  
  def self.destroy_all
    @@all.clear
  end
  
end
