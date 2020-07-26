# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "csv"

CSV.foreach('db/demo_user.csv') do |info|
	User.create! ({
		name:  info[0],
		email: info[1],
		location: info[2],
		introduction: info[3],
		password: info[4]
	})

Sound.create!(
  [
    {
      user_id: 1,
      title: "kick",
      genre: "other",
      mood: "night",
      file: File.open('./app/assets/audios/kick.mp3')

    },
    {
      user_id: 2,
      title: "techno",
      genre: "techno",
      mood: "club",
      file: File.open('./app/assets/audios/techno.mp3')
    },
    {
      user_id: 3,
      title: "techno2",
      genre: "techno",
      mood: "nightclub",
      file: File.open('./app/assets/audios/techno_sample02.mp3')
    }
  ]
  )

Video.create!(
  [
    {
      user_id: 1,
      title: "girl",
      genre: "human",
      mood: "night",
      file: File.open('./app/assets/videos/girl.mp4')

    },
    {
      user_id: 2,
      title: "neonlight",
      genre: "neon",
      mood: "black",
      file: File.open('./app/assets/videos/hindu.mp4')
    },
    {
      user_id: 3,
      title: "love",
      genre: "love",
      mood: "nightclub",
      file: File.open('./app/assets/videos/love.mp4')
    }
  ]
  )

Stage.create!(
  [
    {
      user_id: 5,
      title: "girl",
      genre: "human",
      mood: "night",
      file: File.open('./app/assets/videos/girl.mp4')

    },
    {
      user_id: 6,
      title: "neonlight",
      genre: "neon",
      mood: "black",
      file: File.open('./app/assets/videos/hindu.mp4')
    },
    {
      user_id: 7,
      title: "love",
      genre: "love",
      mood: "nightclub",
      file: File.open('./app/assets/videos/love.mp4')
    }
  ]
  )

end

