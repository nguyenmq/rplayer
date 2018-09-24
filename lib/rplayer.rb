require 'pp'

require_relative './db_accessor.rb'

db_accessor = DbAccessor.new(File.expand_path('../../data/library.db', __FILE__))

results = db_accessor.query_album('black')

results.each do |row|
  pp row
end

results = db_accessor.query_tracks(373)

results.each do |row|
  pp row
end

db_accessor.insert_disc_id("aaa", Time.now().to_i)

db_accessor.close()
