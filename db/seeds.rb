# Seeds file for /home/andrzej/RubymineProjects/RoR-24/storage/development.sqlite3:

  puts 'Seeding: Course'
courses_1 = Course.create(nazwa: "matematyka", created_at: "2024-10-22 17:43:48 UTC", updated_at: "2024-10-22 17:43:48 UTC")
courses_2 = Course.create(nazwa: "fizyka", created_at: "2024-10-22 17:43:53 UTC", updated_at: "2024-10-22 17:43:53 UTC")
  puts 'Seeding: Group'
groups_1 = Group.create(nr: "gr 1", nazwa: "Grupa 1", created_at: "2024-10-22 17:27:02 UTC", updated_at: "2024-10-22 17:27:02 UTC")
groups_2 = Group.create(nr: "gr 2", nazwa: "Grupa 2", created_at: "2024-10-22 17:27:15 UTC", updated_at: "2024-10-22 17:27:15 UTC")
