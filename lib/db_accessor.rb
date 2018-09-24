require 'sqlite3'

# Accesses the beets library database

class DbAccessor

  def initialize(db_path)
    @db = SQLite3::Database.new(db_path)
  end

  # Close the connection to the database
  def close()
    @db.close unless @db == nil
    @db = nil
  end

  # Inserts a disc id and album id pair into the table. The disc id is read
  # from the CD. The album id is the one provided by beets.
  #
  # TODO: database throws exception on failure -> need to handle them
  def insert_disc_id(disc_id, album_id)
    check_db_connection()
    @db.execute("INSERT INTO disc_map (disc_id, album_id) VALUES (?, ?)", [disc_id, album_id])
  end

  # Queries the library for an album name. Allows partial matches
  def query_album(album)
    check_db_connection()
    results = @db.execute("SELECT id, album FROM albums WHERE album LIKE ?", "%#{album}%")
  end

  # Queries the library for tracks that match the given album id
  def query_tracks(album_id)
    check_db_connection()
    results = @db.execute("SELECT track, title, album, album_id FROM items WHERE album_id = ?", album_id)
  end

  private

  # Checks if the database connection has been initialized
  def check_db_connection
    raise "Database connection not initialized" if @db == nil
  end

end
