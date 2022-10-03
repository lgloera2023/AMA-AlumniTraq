Role.create!([
  {name: "Alumni"},
  {name: "Member"},
  {name: "Service"},
  {name: "Treasury"},
  {name: "Public Relations"},
  {name: "Special Events"},
  {name: "Brotherhood"},
  {name: "Social"},
  {name: "Historian"},
  {name: "IT"},
  {name: "Vice President"},
  {name: "President"}
])
User.create!([
  {role_id: 10, first_name: "Jack", last_name: "Couture", major: "Computer Engineering", graduation_year: 2024, email: "jncouture@tamu.edu", phone: ""},
  {role_id: 1, first_name: "Alum", last_name: "One", major: "Computer Science", graduation_year: 2020, email: "alum.one@gmail.com", phone: "1111110000"},
  {role_id: 1, first_name: "Alum", last_name: "Two", major: "Computer Engineering", graduation_year: 2019, email: "alum.two@me.com", phone: "1111110001"},
  {role_id: 1, first_name: "Alum", last_name: "Three", major: "Poultry Science", graduation_year: 2018, email: "alum.three@comcast.net", phone: "1111110002"},
  {role_id: 11, first_name: "Carolini", last_name: "Pal", major: "Finance", graduation_year: 2026, email: "cpal@tamu.edu", phone: "1234443333"},

])
Alumnus.create!([
  {user_id: 3, bio: "I am alum two.", job_title: "Embedded Systems Designer", employer: "L3Harris", availability: "By pigeon carrier."},
  {user_id: 2, bio: "I am alum one.", job_title: "Junior Software Developer", employer: "Google", availability: "I'll respond in my DM's occasionally."},
  {user_id: 4, bio: "I am alum three.", job_title: "Butcher Supervisor", employer: "Tyson Meat Co.", availability: "On weekends and holidays."}
])