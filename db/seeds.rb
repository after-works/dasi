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

song = Song.new({title:"추억은 아름다운 기억", youtube_id:"wMAQOG02ob4"})
song.save
songtag = Songtag.new({title:"재미없는 성광이가 추천한 곡들", original_song_id:"wMAQOG02ob4", author:"sxkng"})
songtag.save
song = Song.new({title:"그토록 믿었던 그 여자가 시집가던 날", youtube_id:"HXXZZpWlJko", tag_id:songtag.id})
song.save
song = Song.new({title:"3호선 매봉역", youtube_id:"e1z0vUmRAVc", tag_id:songtag.id})
song.save
song = Song.new({title:"나가면 고생이야", youtube_id:"Uz5PMVJVBgk", tag_id:songtag.id})
song.save

song = Song.new({title:"김광석", youtube_id:"dHeqQu8a1h0"})
song.save
songtag = Songtag.new({title:"서른즈음에는 누가 제일 잘 불렀을까?", original_song_id:"wMAQOG02ob4", author:"sxkng"})
songtag.save
song = Song.new({title:"인순이", youtube_id:"Qquoi--bZFY", tag_id:songtag.id})
song.save
song = Song.new({title:"이해리(다비치)", youtube_id:"T8GTBV3Hjpg", tag_id:songtag.id})
song.save
song = Song.new({title:"성시경", youtube_id:"YAv7JHrgYu8", tag_id:songtag.id})
song.save
song = Song.new({title:"김건모", youtube_id:"8NJuB1SPv3Q", tag_id:songtag.id})
song.save
song = Song.new({title:"바비킴", youtube_id:"PShz8pyGfAA", tag_id:songtag.id})
song.save
song = Song.new({title:"이은미", youtube_id:"RZ3FIUhoNuw", tag_id:songtag.id})
song.save
song = Song.new({title:"김범", youtube_id:"198mB5WQp-w", tag_id:songtag.id})
song.save

song = Song.new({title:"비오는 압구정", youtube_id:"wVvJvc-QNUs"})
song.save
songtag = Songtag.new({title:"비와 관련된 노래 중 어떤 노래가 가장 좋을", original_song_id:"wMAQOG02ob4", author:"sxkng"})
songtag.save
song = Song.new({title:"비오는 거리", youtube_id:"YMc4GUxp1EY", tag_id:songtag.id})
song.save
song = Song.new({title:"비와당신", youtube_id:"acdAWdnSKmE", tag_id:songtag.id})
song.save
song = Song.new({title:"빗소리", youtube_id:"XFIvbghWSaQ", tag_id:songtag.id})
song.save
song = Song.new({title:"비와 당신의 이야기", youtube_id:"DxyMf2jvLLw", tag_id:songtag.id})
song.save
song = Song.new({title:"빗속에서", youtube_id:"ZZUHHR9XyGc", tag_id:songtag.id})
song.save

song = Song.new({title:"긱스, 소유", youtube_id:"3J-0MJIlLeA"})
song.save
songtag = Songtag.new({title:"Officially missing you 어느 조합이 짱짱맨?", original_song_id:"wMAQOG02ob4", author:"sxkng"})
songtag.save
song = Song.new({title:"악동뮤지션", youtube_id:"foNVZzcoj0Q", tag_id:songtag.id})
song.save

song = Song.new({title:"우리가 헤어진 진짜 이유", youtube_id:"qwHnHYPdSQI"})
song.save
songtag = Songtag.new({title:"윤하의 미니앨범 'Just Listen' 에서 가장 좋은 곡은?", original_song_id:"wMAQOG02ob4", author:"sxkng"})
songtag.save
song = Song.new({title:"Just Listen", youtube_id:"lGc4IDrmXA8", tag_id:songtag.id})
song.save
song = Song.new({title:"One Fine Day", youtube_id:"QFVKsUxiNg4", tag_id:songtag.id})
song.save