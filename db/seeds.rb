# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Sound.create!(
  [
    {
      user_id: 1,
      title: 'kick',
      genre: 'Other',
      mood: 'summer',
      bpm:'60~70',
      hashbody: '#キック',
      detail: '夏に作りました',
      file: File.open('./app/assets/audios/kick.mp3')
    },
    {
      user_id: 2,
      title: 'Bluelightcut',
      genre: 'Techno',
      mood: 'summer',
      bpm:'111~120',
      hashbody: '#四つ打ち',
      detail: 'クラブ行きたい〜',
      file: File.open('./app/assets/audios/techno.mp3')

    },
     {
      user_id: 2,
      title: 'cream_tech',
      genre: 'Techno',
      mood: 'launge',
      bpm:'111~120',
      hashbody: '#テクノ好きと繋がりたい',
      detail: 'クラブ行きたい〜',
      file: File.open('./app/assets/audios/techno_sample02.mp3')
    },
     {
      user_id: 3,
      title: 'chord',
      genre: 'Other',
      mood: 'chill',
      bpm:'',
      hashbody: '#chillout',
      detail: '',
      file: File.open('./app/assets/audios/chord.mp3')
    },
    {
      user_id: 3,
      title: 'dnb_dark',
      genre: 'Drum & Bass',
      mood: 'Drum & Bass',
      bpm:'71~80',
      hashbody: '#Drum&Bass',
      detail: '',
      file: File.open('./app/assets/audios/dnb_dark.mp3')
    },
    {
      user_id: 3,
      title: 'Hanami',
      genre: 'Other',
      mood: 'chill',
      bpm:'',
      hashbody: '#chillout #sakura',
      detail: '',
      file: File.open('./app/assets/audios/hanami.mp3')
    },
    {
      user_id: 4,
      title: 'Harris_intro',
      genre: 'House',
      mood: 'chill',
      bpm:'121~130',
      hashbody: '#house',
      detail: 'housemusic',
      file: File.open('./app/assets/audios/harris2.mp3')
    },
    {
      user_id: 4,
      title: 'Harris_middle',
      genre: 'House',
      mood: 'chill',
      bpm:'121~130',
      hashbody: '#night',
      detail: '',
      file: File.open('./app/assets/audios/harris_middle.mp3')
    },
    {
      user_id: 5,
      title: 'Harris_third',
      genre: 'House',
      mood: 'chill',
      bpm:'121~130',
      hashbody: '#house',
      detail: '',
      file: File.open('./app/assets/audios/harris_third.mp3')
    },
    {
      user_id: 5,
      title: 'Harris_top',
      genre: 'House',
      mood: 'chill',
      bpm:'121~130',
      hashbody: '#houseintro',
      detail: '',
      file: File.open('./app/assets/audios/harris_top.mp3')
    },
    {
      user_id: 5,
      title: 'piano_drum1',
      genre: 'Drum & Bass',
      mood: 'chill',
      bpm:'131~140',
      hashbody: '#ドラムンベース',
      detail: '',
      file: File.open('./app/assets/audios/piano_drum1.mp3')
    },
    {
      user_id: 5,
      title: 'piano_drum2',
      genre: 'House',
      mood: 'chill',
      bpm:'131~140',
      hashbody: '#ドラムンベース',
      detail: '',
      file: File.open('./app/assets/audios/piano_drum2.mp3')
    },
    {
      user_id: 5,
      title: 'rabbit-tech',
      genre: 'Techno',
      mood: 'Techno',
      bpm:'91~100',
      hashbody: '#テクノ',
      detail: '',
      file: File.open('./app/assets/audios/rabbit-techno.mp3')
    },
    {
      user_id: 6,
      title: 'rabbit-sample',
      genre: 'EDM',
      mood: 'EDM',
      bpm:'121~130',
      hashbody: '#EDMっぽくないEDM',
      detail: '',
      file: File.open('./app/assets/audios/rabbit_sample.mp3')
    },
    {
      user_id: 6,
      title: 'Raijin',
      genre: 'Techno',
      mood: 'Techno',
      bpm:'91~100',
      hashbody: '#DTM初心者',
      detail: '',
      file: File.open('./app/assets/audios/sample01.mp3')
    }
  ])



