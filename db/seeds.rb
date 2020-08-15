# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require "csv"

CSV.foreach('db/demo_user.csv') do |row|
  User.create!(
    name: row[0],
    email:row[1],
    location: row[2],
    introduction: row[3],
    password: row[4] )
end

Sound.create!(
  [
    {
      user_id: 1,
      title: 'kick',
      genre: 'Other',
      bpm:'60~70',
      hashbody: '#キック',
      detail: '夏に作りました',
      file: File.open('./app/assets/audios/kick.mp3')
    },
    {
      user_id: 2,
      title: 'Bluelightcut',
      genre: 'Techno',
      bpm:'111~120',
      hashbody: '#四つ打ち',
      detail: 'クラブ行きたい〜',
      file: File.open('./app/assets/audios/techno.mp3')

    },
     {
      user_id: 2,
      title: 'cream_tech',
      genre: 'Techno',
      bpm:'111~120',
      hashbody: '#テクノ好きと繋がりたい',
      detail: 'クラブ行きたい〜',
      file: File.open('./app/assets/audios/techno_sample02.mp3')
    },
     {
      user_id: 3,
      title: 'chord',
      genre: 'Other',
      bpm:'',
      hashbody: '#chillout',
      detail: '',
      file: File.open('./app/assets/audios/chord.mp3')
    },
    {
      user_id: 3,
      title: 'dnb_dark',
      genre: 'Drum & Bass',
      bpm:'71~80',
      hashbody: '#Drum&Bass',
      detail: '',
      file: File.open('./app/assets/audios/dnb_dark.mp3')
    },
    {
      user_id: 3,
      title: 'Hanami',
      genre: 'Other',
      bpm:'',
      hashbody: '#chillout #sakura',
      detail: '',
      file: File.open('./app/assets/audios/hanami.mp3')
    },
    {
      user_id: 4,
      title: 'Harris_intro',
      genre: 'House',
      bpm:'121~130',
      hashbody: '#house',
      detail: 'housemusic',
      file: File.open('./app/assets/audios/harris2.mp3')
    },
    {
      user_id: 4,
      title: 'Harris_middle',
      genre: 'House',
      bpm:'121~130',
      hashbody: '#night',
      detail: '',
      file: File.open('./app/assets/audios/harris_middle.mp3')
    },
    {
      user_id: 5,
      title: 'Harris_third',
      genre: 'House',
      bpm:'121~130',
      hashbody: '#house',
      detail: '',
      file: File.open('./app/assets/audios/harris_third.mp3')
    },
    {
      user_id: 5,
      title: 'Harris_top',
      genre: 'House',
      bpm:'121~130',
      hashbody: '#houseintro',
      detail: '',
      file: File.open('./app/assets/audios/harris_top.mp3')
    },
    {
      user_id: 5,
      title: 'piano_drum1',
      genre: 'Drum & Bass',
      bpm:'131~140',
      hashbody: '#ドラムンベース',
      detail: '',
      file: File.open('./app/assets/audios/piano_drum1.mp3')
    },
    {
      user_id: 5,
      title: 'piano_drum2',
      genre: 'House',
      bpm:'131~140',
      hashbody: '#ドラムンベース',
      detail: '',
      file: File.open('./app/assets/audios/piano_drum2.mp3')
    },
    {
      user_id: 5,
      title: 'rabbit-tech',
      genre: 'Techno',
      bpm:'91~100',
      hashbody: '#テクノ',
      detail: '',
      file: File.open('./app/assets/audios/rabbit-techno.mp3')
    },
    {
      user_id: 6,
      title: 'rabbit-sample',
      genre: 'EDM',
      bpm:'121~130',
      hashbody: '#EDMっぽくないEDM',
      detail: '',
      file: File.open('./app/assets/audios/rabbit_sample.mp3')
    },
    {
      user_id: 6,
      title: 'Raijin',
      genre: 'Techno',
      bpm:'91~100',
      hashbody: '#DTM初心者',
      detail: '',
      file: File.open('./app/assets/audios/sample01.mp3')
    }
  ])

Video.create!(
  [
    {
      user_id: 1,
      title: 'girl',
      genre: 'Other',
      hashbody: '#girl',
      detail: '夏に作りました',
      file: File.open('./app/assets/videos/girl.mp4')
    },
    {
      user_id: 2,
      title: 'girl_line',
      genre: 'Other',
      hashbody: '#girl_line',
      detail: 'モダン',
      file: File.open('./app/assets/videos/girl_line.mp4'),
      image: File.open('./app/assets/images/girl_line.png')
    },
    {
      user_id: 2,
      title: 'heart',
      genre: 'Other',
      hashbody: '#heart',
      detail: 'heart',
      file: File.open('./app/assets/videos/Heart.mp4'),
      image: File.open('./app/assets/images/heart.png')
    },
    {
      user_id: 2,
      title: 'hindu',
      genre: 'Other',
      hashbody: '#hindu',
      detail: 'indian テイストにしました',
      file: File.open('./app/assets/videos/hindu.mp4')
    },
    {
      user_id: 3,
      title: 'inst=clasics',
      genre: 'Other',
      hashbody: '#clasics',
      detail: '',
      file: File.open('./app/assets/videos/inst=clasics.mp4'),
      image: File.open('./app/assets/images/classic.png')
    },
    {
      user_id: 1,
      title: 'Liq-box',
      genre: 'Other',
      hashbody: '#lip',
      detail: '',
      file: File.open('./app/assets/videos/Liq-box.mp4'),
      image: File.open('./app/assets/images/liq.png')
    },
    {
      user_id: 4,
      title: 'love',
      genre: 'Other',
      hashbody: '#love',
      detail: '',
      file: File.open('./app/assets/videos/love.mp4')
    },
    {
      user_id: 5,
      title: 'lighting',
      genre: 'Other',
      hashbody: '#lighting',
      detail: 'lighting',
      file: File.open('./app/assets/videos/NIKE2.mp4'),
      image: File.open('./app/assets/images/nike.png')
    },
    {
      user_id: 5,
      title: 'noise_lines',
      genre: 'Other',
      hashbody: '#noise',
      detail: 'メタリックテイストです',
      file: File.open('./app/assets/videos/noise_lines.mp4'),
      image: File.open('./app/assets/images/noise_lines.png')
    },
     {
      user_id: 5,
      title: 'noise_v2',
      genre: 'Other',
      hashbody: '#noise',
      detail: 'メタリックテイスト２作品目です',
      file: File.open('./app/assets/videos/noise_v2.mp4'),
      image: File.open('./app/assets/images/noise_v2.png')
    },
     {
      user_id: 6,
      title: 'Pink_tunnel',
      genre: 'Other',
      hashbody: '#Pink',
      detail: 'Pink !Pink! Pink !',
      file: File.open('./app/assets/videos/Pink-tunnel.mp4'),
      image: File.open('./app/assets/images/pink_tunnel.png')
    },
     {
      user_id: 6,
      title: 'pop_doves',
      genre: 'Other',
      hashbody: '#ハト',
      detail: '白鳩をモチーフに',
      file: File.open('./app/assets/videos/pop_doves.mp4'),
      image: File.open('./app/assets/images/pop_doves.png')
    },
    {
      user_id: 7,
      title: 'shape',
      genre: 'Other',
      hashbody: '#shape',
      detail: '赤青に絞って表現',
      file: File.open('./app/assets/videos/Pranets-shape.mp4'),
      image: File.open('./app/assets/images/shape.png')
    },
    {
      user_id: 7,
      title: 'ball',
      genre: 'Other',
      hashbody: '#ball',
      detail: 'グラフィック',
      file: File.open('./app/assets/videos/riq_ball.mp4'),
      image: File.open('./app/assets/images/rip.png')
    },
    {
      user_id: 7,
      title: 'rope',
      genre: 'Other',
      hashbody: '#rope',
      detail: 'あのロープです笑',
      file: File.open('./app/assets/videos/rope2.mp4'),
      image: File.open('./app/assets/images/rope.png')
    },
    {
      user_id: 8,
      title: 'rose',
      genre: 'Other',
      hashbody: '#rose',
      detail: 'Rose',
      file: File.open('./app/assets/videos/rose.mp4'),
      image: File.open('./app/assets/images/rope.png')
    },
    {
      user_id: 8,
      title: 'sign',
      genre: 'Other',
      hashbody: '#sign',
      detail: 'sign',
      file: File.open('./app/assets/videos/Sign.mp4'),
      image: File.open('./app/assets/images/sign.png')
    },
     {
      user_id: 8,
      title: 'skull',
      genre: 'Other',
      hashbody: '#skull',
      detail: 'スカルグラフィック',
      file: File.open('./app/assets/videos/SKULL.mp4'),
      image: File.open('./app/assets/images/skull.png')
    },
     {
      user_id: 9,
      title: 'smoke',
      genre: 'Other',
      hashbody: '#smoke',
      detail: 'smoke',
      file: File.open('./app/assets/videos/smoke7.mp4'),
      image: File.open('./app/assets/images/smok.png')
    }
    ])

Stage.create!(
  [
    {
      user_id: 5,
      title: 'Sky',
      genre: 'Other',
      hashbody: '#sky',
      detail: 'SKY',
      file: File.open('./app/assets/videos/sky.mp4'),
      image: File.open('./app/assets/images/sky.png')
    },
    {
      user_id: 5,
      title: 'pattern',
      genre: 'Other',
      hashbody: '#music',
      detail: 'pattern',
      file: File.open('./app/assets/videos/pattern.mp4'),
      image: File.open('./app/assets/images/pattern.png')
    },
    {
      user_id: 6,
      title: 'Jeep',
      genre: 'Other',
      hashbody: '#Jeep',
      detail: 'Summer',
      file: File.open('./app/assets/videos/jeep.mp4')
    },
    {
      user_id: 7,
      title: 'Spy',
      genre: 'Other',
      hashbody: '#Spy',
      detail: 'Spy',
      file: File.open('./app/assets/videos/spy.mp4'),
      image: File.open('./app/assets/images/spy.png')
    },
    {
      user_id: 7,
      title: 'Snowwinter',
      genre: 'Other',
      hashbody: '#winter',
      detail: 'winter',
      file: File.open('./app/assets/videos/snow.mp4'),
      image: File.open('./app/assets/images/snow.png')
    },
    {
      user_id: 7,
      title: 'green smoke',
      genre: 'Other',
      hashbody: '#green',
      detail: 'green',
      file: File.open('./app/assets/videos/smok.mp4'),
      image: File.open('./app/assets/images/smok.png')
    },

    {
      user_id: 8,
      title: 'Rope',
      genre: 'Other',
      hashbody: '#rope',
      detail: 'Rope',
      file: File.open('./app/assets/videos/rope.mp4'),
      image: File.open('./app/assets/images/rope.png')
    },

    {
      user_id: 8,
      title: 'Rip',
      genre: 'Other',
      hashbody: '#red',
      detail: 'redred',
      file: File.open('./app/assets/videos/rip.mp4'),
      image: File.open('./app/assets/images/rip.png')
    },

    {
      user_id: 9,
      title: 'NIKE',
      genre: 'Other',
      hashbody: '#nike',
      detail: '',
      file: File.open('./app/assets/videos/nike.mp4'),
      image: File.open('./app/assets/images/nike.png')
    },

    {
      user_id: 9,
      title: 'Skull',
      genre: 'Other',
      hashbody: '#skull',
      detail: 'Skull',
      file: File.open('./app/assets/videos/SKULL.mp4'),
      image: File.open('./app/assets/images/skull.png')
    }
    ])







