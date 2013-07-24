# encoding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create({name:"test1", uid: "701616426"})
User.create({name:"test2", uid: "752317883"})
User.create({name:"test3", uid: "1013059472"})


song = Song.new({title:"이멋 이건 꼭 해얗!", youtube_id:"tqJfCPcu0As"})
song.save

songtag = Songtag.new({title:"올해 게임 기대작", original_song_id:song.id, author:"sxkng"})
songtag.save

song.tag_id = songtag.id
song.save

song = Song.new({title:"이멋 이건 꼭 해얗!", youtube_id:"tqJfCPcu0As", tag_id:songtag.id})
song.save
song = Song.new({title:"이멋 이건 꼭 해얗!", youtube_id:"tqJfCPcu0As", tag_id:songtag.id})
song.save
song = Song.new({title:"이멋 이건 꼭 해얗!", youtube_id:"tqJfCPcu0As", tag_id:songtag.id})
song.save
song = Song.new({title:"이멋 이건 꼭 해얗!", youtube_id:"tqJfCPcu0As", tag_id:songtag.id})
song.save
