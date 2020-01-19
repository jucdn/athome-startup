# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

buildings = Building.create([{ name: 'Building1', city: 'City1' }])
Room.create([{ name: 'Room1', building_id: buildings.first.id, hid: 'fake_hid_1', color: '#467fcf' }])
Room.create([{ name: 'Room2', building_id: buildings.first.id, hid: 'fake_hid_2', color: '#5eba00' }])
Room.create([{ name: 'Room3', building_id: buildings.first.id, hid: 'fake_hid_3', color: '#cd201f' }])
Room.create([{ name: 'Room4', building_id: buildings.first.id, hid: 'fake_hid_4', color: '#343a40' }])
Room.create([{ name: 'Room5', building_id: buildings.first.id, hid: 'fake_hid_5', color: '#f1c40f' }])
