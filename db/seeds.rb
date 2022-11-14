# frozen_string_literal: true

JobCategory.create!([
  { name: 'Accounting' },
  { name: 'Administrative' },
  { name: 'Arts and Design' },
  { name: 'Business Development' },
  { name: 'Community and Social Services' },
  { name: 'Consulting' },
  { name: 'Cybersecurity' },
  { name: 'Education' },
  { name: 'Engineering' },
  { name: 'Entrepreneurship' },
  { name: 'Finance' },
  { name: 'Healthcare Services' },
  { name: 'Human Resources' },
  { name: 'Information Technology' },
  { name: 'Legal' },
  { name: 'Marketing' },
  { name: 'Media and Communication' },
  { name: 'Military and Protective Services' },
  { name: 'Operations' },
  { name: 'Product Management' },
  { name: 'Program and Project Management' },
  { name: 'Purchasing' },
  { name: 'Quality Assurance' },
  { name: 'Real Estate' },
  { name: 'Research' },
  { name: 'Sales' },
  { name: 'Software Development' },
  { name: 'Support' }
]
                   )
puts("#{JobCategory.count} total job categories created.")
Major.create!([
  { name: 'International Studies' },
  { name: 'Kinesiology' },
  { name: 'Agribusiness' },
  { name: 'Agricultural Economics' },
  { name: 'Agricultural Communications and Journalism' },
  { name: 'Agricultural Leadership and Development' },
  { name: 'Agricultural Science' },
  { name: 'Animal Science' },
  { name: 'Biochemistry' },
  { name: 'Genetics' },
  { name: 'Agricultural Systems Management' },
  { name: 'Biological and Agricultural Engineering' },
  { name: 'Ecology and Conservation Biology' },
  { name: 'Entomology' },
  { name: 'Forensic and Investigative Sciences' },
  { name: 'Food Science and Technology' },
  { name: 'Food Systems Industry Management' },
  { name: 'Horticulture' },
  { name: 'Nutrition' },
  { name: 'Bioenvironmental Sciences' },
  { name: 'Poultry Science' },
  { name: 'Rangeland Ecology and Management' },
  { name: 'Rangeland, Wildlife and Fisheries Management' },
  { name: 'Recreation, Park and Tourism Sciences' },
  { name: 'Plant and Environmental Soil Science' },
  { name: 'Turfgrass Science' },
  { name: 'Environmental Design Architectural Studies' },
  { name: 'Construction Science' },
  { name: 'Landscape Architecture' },
  { name: 'Urban and Regional Planning' },
  { name: 'Biomedical Sciences' },
  { name: 'Environmental Studies' },
  { name: 'Neuroscience' },
  { name: 'University Studies' },
  { name: 'Anthropology' },
  { name: 'Meteorology' },
  { name: 'Biology' },
  { name: 'Microbiology' },
  { name: 'Molecular and Cell Biology' },
  { name: 'Zoology' },
  { name: 'Chemistry' },
  { name: 'Communication' },
  { name: 'Telecommunication Media Studies' },
  { name: 'Economics' },
  { name: 'English' },
  { name: 'Environmental Geosciences' },
  { name: 'Geographic Information Science and Technology' },
  { name: 'Geography' },
  { name: 'Geology' },
  { name: 'Geophysics' },
  { name: 'Classics' },
  { name: 'Modern Languages' },
  { name: 'Spanish' },
  { name: 'History' },
  { name: 'Applied Mathematical Sciences' },
  { name: 'Mathematics' },
  { name: 'Oceanography' },
  { name: 'Philosophy' },
  { name: 'Physics' },
  { name: 'Psychology' },
  { name: 'Sociology' },
  { name: "Women's and Gender Studies" },
  { name: 'Statistics' },
  { name: 'Business Administration' },
  { name: 'Accounting' },
  { name: 'Finance' },
  { name: 'Management Information Systems' },
  { name: 'Supply Chain Management' },
  { name: 'Management' },
  { name: 'Marketing' },
  { name: 'Dental Hygiene' },
  { name: 'Human Resource Development' },
  { name: 'Sport Management' },
  { name: 'Education' },
  { name: 'Aerospace Engineering' },
  { name: 'Biomedical Engineering' },
  { name: 'Chemical Engineering' },
  { name: 'Civil Engineering' },
  { name: 'Environmental Engineering' },
  { name: 'Computer Engineering' },
  { name: 'Computer Science' },
  { name: 'Computing' },
  { name: 'Electrical Engineering' },
  { name: 'Electronic Systems Engineering Technology' },
  { name: 'Industrial Distribution' },
  { name: 'Manufacturing and Mechanical Engineering Technology' },
  { name: 'Multidisciplinary Engineering Technology' },
  { name: 'Technology Management' },
  { name: 'Industrial Engineering' },
  { name: 'Materials Science and Engineering' },
  { name: 'Mechanical Engineering' },
  { name: 'Architectural Engineering' },
  { name: 'Interdisciplinary Engineering' },
  { name: 'Nuclear Engineering' },
  { name: 'Ocean Engineering' },
  { name: 'Petroleum Engineering' },
  { name: 'Political Science' },
  { name: 'Nursing' },
  { name: 'Performance Studies' },
  { name: 'Visualization' },
  { name: 'Public Health' },
  { name: 'Community Health*' },
  { name: 'Health*' },
  { name: 'Maritime Studies' },
  { name: 'Marine Biology' },
  { name: 'Marine Fisheries' },
  { name: 'Marine Engineering Technology' },
  { name: 'Coastal Environmental Science and Society' },
  { name: 'Marine Sciences' },
  { name: 'Maritime Business Administration' },
  { name: 'Marine Transportation' }
]
             )
puts("#{Major.count} total majors created.")
Role.create!([
  { name: 'Admin' },
  { name: 'Member' },
  { name: 'Alumni' },
  { name: 'Event Planner' }
]
            )
puts("#{Role.count} total roles created.")

User.create!(
  {
    email: 'alumnitraq.aggiemensalliance@gmail.com',
    role_id: 1,
    first_name: 'Super',
    last_name: 'User',
    major_id: 67,
    graduation_year: 2023,
    phone: '',
    is_approved: true
  }         )

if Rails.env.test? || ENV['use_test_seed'] || Rails.env.development?
  puts("Creating users...")
  User.create!([
    {
      email: 'thegoodag@gmail.com',
      role_id: 3,
      first_name: 'Ole',
      last_name: 'Rock',
      major_id: 65,
      graduation_year: 1954,
      phone: '',
      is_approved: false
    },
    {
      email: 'byron.henderson@gmail.com',
      role_id: 3,
      first_name: 'Byron',
      last_name: 'Henderson',
      major_id: 10,
      graduation_year: 2003,
      phone: '',
      is_approved: false
    },
    {
      email: 'aleah.sloan@gmail.com',
      role_id: 3,
      first_name: 'Aleah',
      last_name: 'Sloan',
      major_id: 83,
      graduation_year: 1942,
      phone: '',
      is_approved: false
    },
    {
      email: 'carmen.gay@gmail.com',
      role_id: 3,
      first_name: 'Carmen',
      last_name: 'Gay',
      major_id: 104,
      graduation_year: 1980,
      phone: '',
      is_approved: false
    },
    {
      email: 'brenda.lindsey@gmail.com',
      role_id: 3,
      first_name: 'Brenda',
      last_name: 'Lindsey',
      major_id: 82,
      graduation_year: 1932,
      phone: '',
      is_approved: false
    },
    {
      email: 'saul.cole@gmail.com',
      role_id: 3,
      first_name: 'Saul',
      last_name: 'Cole',
      major_id: 55,
      graduation_year: 1958,
      phone: '',
      is_approved: false
    },
    {
      email: 'justin.tate@gmail.com',
      role_id: 3,
      first_name: 'Justin',
      last_name: 'Tate',
      major_id: 63,
      graduation_year: 1968,
      phone: '',
      is_approved: false
    },
    {
      email: 'zain.herrera@gmail.com',
      role_id: 3,
      first_name: 'Zain',
      last_name: 'Herrera',
      major_id: 30,
      graduation_year: 2006,
      phone: '',
      is_approved: false
    },
    {
      email: 'jeremy.becker@gmail.com',
      role_id: 3,
      first_name: 'Jeremy',
      last_name: 'Becker',
      major_id: 66,
      graduation_year: 1959,
      phone: '',
      is_approved: false
    },
    {
      email: 'kylee.reed@gmail.com',
      role_id: 3,
      first_name: 'Kylee',
      last_name: 'Reed',
      major_id: 48,
      graduation_year: 2003,
      phone: '',
      is_approved: false
    },
    {
      email: 'breanna.solis@gmail.com',
      role_id: 3,
      first_name: 'Breanna',
      last_name: 'Solis',
      major_id: 28,
      graduation_year: 1983,
      phone: '',
      is_approved: true
    },
    {
      email: 'lilian.rose@gmail.com',
      role_id: 3,
      first_name: 'Lilian',
      last_name: 'Rose',
      major_id: 74,
      graduation_year: 2020,
      phone: '',
      is_approved: true
    },
    {
      email: 'kayley.dickson@gmail.com',
      role_id: 3,
      first_name: 'Kayley',
      last_name: 'Dickson',
      major_id: 34,
      graduation_year: 1964,
      phone: '',
      is_approved: true
    },
    {
      email: 'mikaela.mora@gmail.com',
      role_id: 3,
      first_name: 'Mikaela',
      last_name: 'Mora',
      major_id: 3,
      graduation_year: 1925,
      phone: '',
      is_approved: true
    },
    {
      email: 'justin.travis@gmail.com',
      role_id: 3,
      first_name: 'Justin',
      last_name: 'Travis',
      major_id: 18,
      graduation_year: 1961,
      phone: '',
      is_approved: true
    },
    {
      email: 'edith.soto@gmail.com',
      role_id: 3,
      first_name: 'Edith',
      last_name: 'Soto',
      major_id: 48,
      graduation_year: 1963,
      phone: '',
      is_approved: true
    },
    {
      email: 'phoebe.sandoval@gmail.com',
      role_id: 3,
      first_name: 'Phoebe',
      last_name: 'Sandoval',
      major_id: 56,
      graduation_year: 1935,
      phone: '',
      is_approved: true
    },
    {
      email: 'evelyn.kim@gmail.com',
      role_id: 3,
      first_name: 'Evelyn',
      last_name: 'Kim',
      major_id: 108,
      graduation_year: 1998,
      phone: '',
      is_approved: true
    },
    {
      email: 'keira.liu@gmail.com',
      role_id: 3,
      first_name: 'Keira',
      last_name: 'Liu',
      major_id: 23,
      graduation_year: 1997,
      phone: '',
      is_approved: true
    },
    {
      email: 'ezequiel.bond@gmail.com',
      role_id: 3,
      first_name: 'Ezequiel',
      last_name: 'Bond',
      major_id: 99,
      graduation_year: 2012,
      phone: '',
      is_approved: true
    },
    {
      email: 'wyatt.cobb@gmail.com',
      role_id: 3,
      first_name: 'Wyatt',
      last_name: 'Cobb',
      major_id: 80,
      graduation_year: 1945,
      phone: '',
      is_approved: true
    },
    {
      email: 'josh.murphy@gmail.com',
      role_id: 3,
      first_name: 'Josh',
      last_name: 'Murphy',
      major_id: 56,
      graduation_year: 2006,
      phone: '',
      is_approved: true
    },
    {
      email: 'shane.rocha@gmail.com',
      role_id: 3,
      first_name: 'Shane',
      last_name: 'Rocha',
      major_id: 60,
      graduation_year: 1940,
      phone: '',
      is_approved: true
    },
    {
      email: 'justin.ramirez@gmail.com',
      role_id: 3,
      first_name: 'Justin',
      last_name: 'Ramirez',
      major_id: 25,
      graduation_year: 2012,
      phone: '',
      is_approved: true
    },
    {
      email: 'rene.mahoney@gmail.com',
      role_id: 3,
      first_name: 'Rene',
      last_name: 'Mahoney',
      major_id: 4,
      graduation_year: 1984,
      phone: '',
      is_approved: true
    },
    {
      email: 'deon.wiggins@gmail.com',
      role_id: 3,
      first_name: 'Deon',
      last_name: 'Wiggins',
      major_id: 24,
      graduation_year: 1948,
      phone: '',
      is_approved: true
    },
    {
      email: 'dario.beard@gmail.com',
      role_id: 3,
      first_name: 'Dario',
      last_name: 'Beard',
      major_id: 63,
      graduation_year: 1936,
      phone: '',
      is_approved: true
    },
    {
      email: 'meredith.marks@gmail.com',
      role_id: 3,
      first_name: 'Meredith',
      last_name: 'Marks',
      major_id: 110,
      graduation_year: 2022,
      phone: '',
      is_approved: true
    },
    {
      email: 'lily.pratt@gmail.com',
      role_id: 3,
      first_name: 'Lily',
      last_name: 'Pratt',
      major_id: 61,
      graduation_year: 1936,
      phone: '',
      is_approved: true
    },
    {
      email: 'diego.mendez@gmail.com',
      role_id: 3,
      first_name: 'Diego',
      last_name: 'Mendez',
      major_id: 6,
      graduation_year: 1932,
      phone: '',
      is_approved: true
    },
    {
      email: 'jared.olsen@gmail.com',
      role_id: 3,
      first_name: 'Jared',
      last_name: 'Olsen',
      major_id: 101,
      graduation_year: 1947,
      phone: '',
      is_approved: true
    },
    {
      email: 'ayana.howell@gmail.com',
      role_id: 3,
      first_name: 'Ayana',
      last_name: 'Howell',
      major_id: 103,
      graduation_year: 2006,
      phone: '',
      is_approved: true
    },
    {
      email: 'aaden.contreras@gmail.com',
      role_id: 3,
      first_name: 'Aaden',
      last_name: 'Contreras',
      major_id: 110,
      graduation_year: 2013,
      phone: '',
      is_approved: true
    },
    {
      email: 'baron.gates@gmail.com',
      role_id: 3,
      first_name: 'Baron',
      last_name: 'Gates',
      major_id: 100,
      graduation_year: 2001,
      phone: '',
      is_approved: true
    },
    {
      email: 'joe.davis@gmail.com',
      role_id: 3,
      first_name: 'Joe',
      last_name: 'Davis',
      major_id: 54,
      graduation_year: 1968,
      phone: '',
      is_approved: true
    },
    {
      email: 'gage.sheppard@gmail.com',
      role_id: 3,
      first_name: 'Gage',
      last_name: 'Sheppard',
      major_id: 105,
      graduation_year: 1983,
      phone: '',
      is_approved: true
    },
    {
      email: 'gracie.hicks@gmail.com',
      role_id: 3,
      first_name: 'Gracie',
      last_name: 'Hicks',
      major_id: 54,
      graduation_year: 1976,
      phone: '',
      is_approved: true
    },
    {
      email: 'alexander.rollins@gmail.com',
      role_id: 3,
      first_name: 'Alexander',
      last_name: 'Rollins',
      major_id: 108,
      graduation_year: 1949,
      phone: '',
      is_approved: true
    },
    {
      email: 'danielle.boone@gmail.com',
      role_id: 3,
      first_name: 'Danielle',
      last_name: 'Boone',
      major_id: 58,
      graduation_year: 1997,
      phone: '',
      is_approved: true
    },
    {
      email: 'aaron.stokes@gmail.com',
      role_id: 3,
      first_name: 'Aaron',
      last_name: 'Stokes',
      major_id: 29,
      graduation_year: 1980,
      phone: '',
      is_approved: true
    },
    {
      email: 'giancarlo.roberson@gmail.com',
      role_id: 3,
      first_name: 'Giancarlo',
      last_name: 'Roberson',
      major_id: 78,
      graduation_year: 1974,
      phone: '',
      is_approved: true
    },
    {
      email: 'quintin.andrews@gmail.com',
      role_id: 3,
      first_name: 'Quintin',
      last_name: 'Andrews',
      major_id: 59,
      graduation_year: 1989,
      phone: '',
      is_approved: true
    },
    {
      email: 'kaya.fitzgerald@gmail.com',
      role_id: 3,
      first_name: 'Kaya',
      last_name: 'Fitzgerald',
      major_id: 3,
      graduation_year: 1933,
      phone: '',
      is_approved: true
    },
    {
      email: 'callum.serrano@gmail.com',
      role_id: 3,
      first_name: 'Callum',
      last_name: 'Serrano',
      major_id: 103,
      graduation_year: 1925,
      phone: '',
      is_approved: true
    },
    {
      email: 'matthew.dunn@gmail.com',
      role_id: 3,
      first_name: 'Matthew',
      last_name: 'Dunn',
      major_id: 34,
      graduation_year: 1939,
      phone: '',
      is_approved: true
    },
    {
      email: 'aimee.mcmillan@gmail.com',
      role_id: 3,
      first_name: 'Aimee',
      last_name: 'Mcmillan',
      major_id: 95,
      graduation_year: 1959,
      phone: '',
      is_approved: true
    },
    {
      email: 'annabel.townsend@gmail.com',
      role_id: 3,
      first_name: 'Annabel',
      last_name: 'Townsend',
      major_id: 52,
      graduation_year: 1977,
      phone: '',
      is_approved: true
    },
    {
      email: 'osvaldo.thomas@gmail.com',
      role_id: 3,
      first_name: 'Osvaldo',
      last_name: 'Thomas',
      major_id: 103,
      graduation_year: 1983,
      phone: '',
      is_approved: true
    },
    {
      email: 'deven.sandoval@gmail.com',
      role_id: 3,
      first_name: 'Deven',
      last_name: 'Sandoval',
      major_id: 54,
      graduation_year: 1933,
      phone: '',
      is_approved: true
    },
    {
      email: 'haylie.waller@gmail.com',
      role_id: 3,
      first_name: 'Haylie',
      last_name: 'Waller',
      major_id: 89,
      graduation_year: 2005,
      phone: '',
      is_approved: true
    },
    {
      email: 'charles.glenn@gmail.com',
      role_id: 3,
      first_name: 'Charles',
      last_name: 'Glenn',
      major_id: 81,
      graduation_year: 1962,
      phone: '',
      is_approved: true
    },
    {
      email: 'kenyon.vaughn@gmail.com',
      role_id: 3,
      first_name: 'Kenyon',
      last_name: 'Vaughn',
      major_id: 85,
      graduation_year: 2010,
      phone: '',
      is_approved: true
    },
    {
      email: 'nadia.farley@gmail.com',
      role_id: 3,
      first_name: 'Nadia',
      last_name: 'Farley',
      major_id: 45,
      graduation_year: 2002,
      phone: '',
      is_approved: true
    },
    {
      email: 'esther.mack@gmail.com',
      role_id: 3,
      first_name: 'Esther',
      last_name: 'Mack',
      major_id: 24,
      graduation_year: 1992,
      phone: '',
      is_approved: true
    },
    {
      email: 'declan.ochoa@gmail.com',
      role_id: 3,
      first_name: 'Declan',
      last_name: 'Ochoa',
      major_id: 99,
      graduation_year: 1975,
      phone: '',
      is_approved: true
    },
    {
      email: 'keegan.gallegos@gmail.com',
      role_id: 3,
      first_name: 'Keegan',
      last_name: 'Gallegos',
      major_id: 41,
      graduation_year: 1981,
      phone: '',
      is_approved: true
    },
    {
      email: 'jaylon.henson@gmail.com',
      role_id: 3,
      first_name: 'Jaylon',
      last_name: 'Henson',
      major_id: 44,
      graduation_year: 1975,
      phone: '',
      is_approved: true
    },
    {
      email: 'raymond.hill@gmail.com',
      role_id: 3,
      first_name: 'Raymond',
      last_name: 'Hill',
      major_id: 30,
      graduation_year: 1974,
      phone: '',
      is_approved: true
    },
    {
      email: 'braxton.wu@gmail.com',
      role_id: 3,
      first_name: 'Braxton',
      last_name: 'Wu',
      major_id: 99,
      graduation_year: 2001,
      phone: '',
      is_approved: true
    },
    {
      email: 'micah.thompson@gmail.com',
      role_id: 3,
      first_name: 'Micah',
      last_name: 'Thompson',
      major_id: 7,
      graduation_year: 2014,
      phone: '',
      is_approved: true
    },
    {
      email: 'adyson.gibson@gmail.com',
      role_id: 3,
      first_name: 'Adyson',
      last_name: 'Gibson',
      major_id: 98,
      graduation_year: 1992,
      phone: '',
      is_approved: true
    },
    {
      email: 'ray.banks@gmail.com',
      role_id: 3,
      first_name: 'Ray',
      last_name: 'Banks',
      major_id: 84,
      graduation_year: 1930,
      phone: '',
      is_approved: true
    },
    {
      email: 'raelynn.bullock@gmail.com',
      role_id: 3,
      first_name: 'Raelynn',
      last_name: 'Bullock',
      major_id: 109,
      graduation_year: 1924,
      phone: '',
      is_approved: true
    },
    {
      email: 'braiden.spears@gmail.com',
      role_id: 3,
      first_name: 'Braiden',
      last_name: 'Spears',
      major_id: 46,
      graduation_year: 2013,
      phone: '',
      is_approved: true
    },
    {
      email: 'camilla.estes@gmail.com',
      role_id: 3,
      first_name: 'Camilla',
      last_name: 'Estes',
      major_id: 9,
      graduation_year: 1944,
      phone: '',
      is_approved: true
    },
    {
      email: 'alexandra.wolf@gmail.com',
      role_id: 3,
      first_name: 'Alexandra',
      last_name: 'Wolf',
      major_id: 94,
      graduation_year: 2018,
      phone: '',
      is_approved: true
    },
    {
      email: 'violet.pollard@gmail.com',
      role_id: 3,
      first_name: 'Violet',
      last_name: 'Pollard',
      major_id: 99,
      graduation_year: 1991,
      phone: '',
      is_approved: true
    },
    {
      email: 'julien.camacho@gmail.com',
      role_id: 3,
      first_name: 'Julien',
      last_name: 'Camacho',
      major_id: 2,
      graduation_year: 1950,
      phone: '',
      is_approved: true
    },
    {
      email: 'romeo.blackburn@gmail.com',
      role_id: 3,
      first_name: 'Romeo',
      last_name: 'Blackburn',
      major_id: 2,
      graduation_year: 1979,
      phone: '',
      is_approved: true
    },
    {
      email: 'diego.dudley@gmail.com',
      role_id: 3,
      first_name: 'Diego',
      last_name: 'Dudley',
      major_id: 100,
      graduation_year: 1964,
      phone: '',
      is_approved: true
    },
    {
      email: 'nelson.perez@gmail.com',
      role_id: 3,
      first_name: 'Nelson',
      last_name: 'Perez',
      major_id: 57,
      graduation_year: 1997,
      phone: '',
      is_approved: true
    },
    {
      email: 'monique.fuller@gmail.com',
      role_id: 3,
      first_name: 'Monique',
      last_name: 'Fuller',
      major_id: 36,
      graduation_year: 1927,
      phone: '',
      is_approved: true
    },
    {
      email: 'lukas.lutz@gmail.com',
      role_id: 3,
      first_name: 'Lukas',
      last_name: 'Lutz',
      major_id: 94,
      graduation_year: 1984,
      phone: '',
      is_approved: true
    },
    {
      email: 'rhianna.yu@gmail.com',
      role_id: 3,
      first_name: 'Rhianna',
      last_name: 'Yu',
      major_id: 28,
      graduation_year: 1977,
      phone: '',
      is_approved: true
    },
    {
      email: 'jane.dickson@gmail.com',
      role_id: 3,
      first_name: 'Jane',
      last_name: 'Dickson',
      major_id: 63,
      graduation_year: 1956,
      phone: '',
      is_approved: true
    },
    {
      email: 'hayden.simon@gmail.com',
      role_id: 3,
      first_name: 'Hayden',
      last_name: 'Simon',
      major_id: 72,
      graduation_year: 1991,
      phone: '',
      is_approved: true
    },
    {
      email: 'sarai.livingston@gmail.com',
      role_id: 2,
      first_name: 'Sarai',
      last_name: 'Livingston',
      major_id: 60,
      graduation_year: 2026,
      phone: '',
      is_approved: true
    },
    {
      email: 'antoine.hobbs@gmail.com',
      role_id: 2,
      first_name: 'Antoine',
      last_name: 'Hobbs',
      major_id: 16,
      graduation_year: 2024,
      phone: '',
      is_approved: true
    },
    {
      email: 'porter.skinner@gmail.com',
      role_id: 2,
      first_name: 'Porter',
      last_name: 'Skinner',
      major_id: 56,
      graduation_year: 2023,
      phone: '',
      is_approved: true
    },
    {
      email: 'braedon.ward@gmail.com',
      role_id: 2,
      first_name: 'Braedon',
      last_name: 'Ward',
      major_id: 72,
      graduation_year: 2023,
      phone: '',
      is_approved: true
    },
    {
      email: 'abagail.goodman@gmail.com',
      role_id: 2,
      first_name: 'Abagail',
      last_name: 'Goodman',
      major_id: 83,
      graduation_year: 2026,
      phone: '',
      is_approved: true
    },
    {
      email: 'sterling.cameron@gmail.com',
      role_id: 2,
      first_name: 'Sterling',
      last_name: 'Cameron',
      major_id: 99,
      graduation_year: 2025,
      phone: '',
      is_approved: true
    },
    {
      email: 'dwayne.bradshaw@gmail.com',
      role_id: 2,
      first_name: 'Dwayne',
      last_name: 'Bradshaw',
      major_id: 47,
      graduation_year: 2023,
      phone: '',
      is_approved: true
    },
    {
      email: 'anne.mckay@gmail.com',
      role_id: 2,
      first_name: 'Anne',
      last_name: 'Mckay',
      major_id: 28,
      graduation_year: 2024,
      phone: '',
      is_approved: true
    },
    {
      email: 'elyse.gutierrez@gmail.com',
      role_id: 2,
      first_name: 'Elyse',
      last_name: 'Gutierrez',
      major_id: 85,
      graduation_year: 2023,
      phone: '',
      is_approved: true
    },
    {
      email: 'cohen.dickerson@gmail.com',
      role_id: 2,
      first_name: 'Cohen',
      last_name: 'Dickerson',
      major_id: 55,
      graduation_year: 2023,
      phone: '',
      is_approved: true
    },
    {
      email: 'jaylee.barker@gmail.com',
      role_id: 2,
      first_name: 'Jaylee',
      last_name: 'Barker',
      major_id: 75,
      graduation_year: 2026,
      phone: '',
      is_approved: true
    },
    {
      email: 'arielle.harper@gmail.com',
      role_id: 2,
      first_name: 'Arielle',
      last_name: 'Harper',
      major_id: 39,
      graduation_year: 2024,
      phone: '',
      is_approved: true
    },
    {
      email: 'peyton.alvarado@gmail.com',
      role_id: 2,
      first_name: 'Peyton',
      last_name: 'Alvarado',
      major_id: 2,
      graduation_year: 2024,
      phone: '',
      is_approved: true
    },
    {
      email: 'kaila.hahn@gmail.com',
      role_id: 2,
      first_name: 'Kaila',
      last_name: 'Hahn',
      major_id: 106,
      graduation_year: 2024,
      phone: '',
      is_approved: true
    },
    {
      email: 'dylan.hood@gmail.com',
      role_id: 2,
      first_name: 'Dylan',
      last_name: 'Hood',
      major_id: 12,
      graduation_year: 2025,
      phone: '',
      is_approved: true
    },
    {
      email: 'karter.landry@gmail.com',
      role_id: 2,
      first_name: 'Karter',
      last_name: 'Landry',
      major_id: 76,
      graduation_year: 2025,
      phone: '',
      is_approved: true
    },
    {
      email: 'hezekiah.bright@gmail.com',
      role_id: 2,
      first_name: 'Hezekiah',
      last_name: 'Bright',
      major_id: 5,
      graduation_year: 2026,
      phone: '',
      is_approved: true
    },
    {
      email: 'izaiah.berry@gmail.com',
      role_id: 2,
      first_name: 'Izaiah',
      last_name: 'Berry',
      major_id: 66,
      graduation_year: 2025,
      phone: '',
      is_approved: true
    },
    {
      email: 'rebekah.figueroa@gmail.com',
      role_id: 2,
      first_name: 'Rebekah',
      last_name: 'Figueroa',
      major_id: 50,
      graduation_year: 2025,
      phone: '',
      is_approved: true
    },
    {
      email: 'kason.reid@gmail.com',
      role_id: 2,
      first_name: 'Kason',
      last_name: 'Reid',
      major_id: 41,
      graduation_year: 2024,
      phone: '',
      is_approved: true
    },
    {
      email: 'zaire.atkins@gmail.com',
      role_id: 2,
      first_name: 'Zaire',
      last_name: 'Atkins',
      major_id: 26,
      graduation_year: 2024,
      phone: '',
      is_approved: true
    },
    {
      email: 'angie.kerr@gmail.com',
      role_id: 2,
      first_name: 'Angie',
      last_name: 'Kerr',
      major_id: 65,
      graduation_year: 2024,
      phone: '',
      is_approved: true
    },
    {
      email: 'makai.boyer@gmail.com',
      role_id: 2,
      first_name: 'Makai',
      last_name: 'Boyer',
      major_id: 94,
      graduation_year: 2023,
      phone: '',
      is_approved: true
    }
  ]
              )
  puts("#{User.count} total users created.")
  puts("#{User.alumni_users.count} total alumni created.")
  puts("Creating alumni info...")
  Alumnus.create!([
    { user_id: 2, bio: nil, job_title: nil, job_category_id: 1, employer: nil, availability: nil },
    {
      user_id: 3,
      bio: nil,
      job_title: 'Construction Manager',
      job_category_id: 28,
      employer: nil,
      availability: nil
    },
    {
      user_id: 4,
      bio: nil,
      job_title: 'IT Manager',
      job_category_id: 20,
      employer: nil,
      availability: nil
    },
    {
      user_id: 5,
      bio: nil,
      job_title: 'Human Resources Assistant',
      job_category_id: 13,
      employer: nil,
      availability: nil
    },
    {
      user_id: 6,
      bio: nil,
      job_title: 'Epidemiologist',
      job_category_id: 19,
      employer: nil,
      availability: nil
    },
    {
      user_id: 7,
      bio: nil,
      job_title: 'Auto Mechanic',
      job_category_id: 21,
      employer: nil,
      availability: nil
    },
    {
      user_id: 8,
      bio: nil,
      job_title: 'Systems Analyst',
      job_category_id: 25,
      employer: nil,
      availability: nil
    },
    {
      user_id: 9,
      bio: nil,
      job_title: 'Speech-Language Pathologist',
      job_category_id: 11,
      employer: nil,
      availability: nil
    },
    {
      user_id: 10,
      bio: nil,
      job_title: 'Software Developer',
      job_category_id: 5,
      employer: nil,
      availability: nil
    },
    {
      user_id: 11,
      bio: nil,
      job_title: 'Recreation & Fitness Worker',
      job_category_id: 9,
      employer: nil,
      availability: nil
    },
    {
      user_id: 12,
      bio: nil,
      job_title: 'High School Teacher',
      job_category_id: 25,
      employer: nil,
      availability: nil
    },
    {
      user_id: 13,
      bio: nil,
      job_title: 'Zoologist',
      job_category_id: 9,
      employer: nil,
      availability: nil
    },
    {
      user_id: 14,
      bio: nil,
      job_title: 'Event Planner',
      job_category_id: 28,
      employer: nil,
      availability: nil
    },
    {
      user_id: 15,
      bio: nil,
      job_title: 'Police Officer',
      job_category_id: 17,
      employer: nil,
      availability: nil
    },
    {
      user_id: 16,
      bio: nil,
      job_title: 'Housekeeper',
      job_category_id: 16,
      employer: nil,
      availability: nil
    },
    {
      user_id: 17,
      bio: nil,
      job_title: 'Reporter',
      job_category_id: 14,
      employer: nil,
      availability: nil
    },
    {
      user_id: 18,
      bio: nil,
      job_title: 'Medical Assistant',
      job_category_id: 9,
      employer: nil,
      availability: nil
    },
    {
      user_id: 19,
      bio: nil,
      job_title: 'Customer Service Representative',
      job_category_id: 13,
      employer: nil,
      availability: nil
    },
    {
      user_id: 20,
      bio: nil,
      job_title: 'Electrician',
      job_category_id: 14,
      employer: nil,
      availability: nil
    },
    {
      user_id: 21,
      bio: nil,
      job_title: 'Preschool Teacher',
      job_category_id: 7,
      employer: nil,
      availability: nil
    },
    {
      user_id: 22,
      bio: nil,
      job_title: 'Carpenter',
      job_category_id: 16,
      employer: nil,
      availability: nil
    },
    {
      user_id: 23,
      bio: nil,
      job_title: 'Social Worker',
      job_category_id: 2,
      employer: nil,
      availability: nil
    },
    {
      user_id: 24,
      bio: nil,
      job_title: 'Occupational Therapist',
      job_category_id: 7,
      employer: nil,
      availability: nil
    },
    {
      user_id: 25,
      bio: nil,
      job_title: 'Electrical Engineer',
      job_category_id: 16,
      employer: nil,
      availability: nil
    },
    {
      user_id: 26,
      bio: nil,
      job_title: 'Budget analyst',
      job_category_id: 16,
      employer: nil,
      availability: nil
    },
    {
      user_id: 27,
      bio: nil,
      job_title: 'Mechanical Engineer',
      job_category_id: 28,
      employer: nil,
      availability: nil
    },
    {
      user_id: 28,
      bio: nil,
      job_title: 'Computer Programmer',
      job_category_id: 21,
      employer: nil,
      availability: nil
    },
    {
      user_id: 29,
      bio: nil,
      job_title: 'Environmental scientist',
      job_category_id: 14,
      employer: nil,
      availability: nil
    },
    {
      user_id: 30,
      bio: nil,
      job_title: 'Sports Coach',
      job_category_id: 12,
      employer: nil,
      availability: nil
    },
    {
      user_id: 31,
      bio: nil,
      job_title: 'School Psychologist',
      job_category_id: 16,
      employer: nil,
      availability: nil
    },
    {
      user_id: 32,
      bio: nil,
      job_title: 'Massage Therapist',
      job_category_id: 22,
      employer: nil,
      availability: nil
    },
    {
      user_id: 33,
      bio: nil,
      job_title: 'Clinical Laboratory Technician',
      job_category_id: 11,
      employer: nil,
      availability: nil
    },
    {
      user_id: 34,
      bio: nil,
      job_title: 'Secretary',
      job_category_id: 13,
      employer: nil,
      availability: nil
    },
    {
      user_id: 35,
      bio: nil,
      job_title: 'Financial Advisor',
      job_category_id: 3,
      employer: nil,
      availability: nil
    },
    {
      user_id: 36,
      bio: nil,
      job_title: 'Accountant',
      job_category_id: 11,
      employer: nil,
      availability: nil
    },
    {
      user_id: 37,
      bio: nil,
      job_title: 'Pharmacist',
      job_category_id: 15,
      employer: nil,
      availability: nil
    },
    { user_id: 38, bio: nil, job_title: 'Coach', job_category_id: 26, employer: nil, availability: nil },
    {
      user_id: 39,
      bio: nil,
      job_title: 'Chemist',
      job_category_id: 25,
      employer: nil,
      availability: nil
    },
    {
      user_id: 40,
      bio: nil,
      job_title: 'Statistician',
      job_category_id: 4,
      employer: nil,
      availability: nil
    },
    { user_id: 41, bio: nil, job_title: 'Writer', job_category_id: 22, employer: nil, availability: nil },
    {
      user_id: 42,
      bio: nil,
      job_title: 'Anthropologist',
      job_category_id: 27,
      employer: nil,
      availability: nil
    },
    {
      user_id: 43,
      bio: nil,
      job_title: 'Logistician',
      job_category_id: 15,
      employer: nil,
      availability: nil
    },
    {
      user_id: 44,
      bio: nil,
      job_title: 'Registered Nurse',
      job_category_id: 28,
      employer: nil,
      availability: nil
    },
    {
      user_id: 45,
      bio: nil,
      job_title: 'Desktop publisher',
      job_category_id: 2,
      employer: nil,
      availability: nil
    },
    { user_id: 46, bio: nil, job_title: 'Artist', job_category_id: 15, employer: nil, availability: nil },
    {
      user_id: 47,
      bio: nil,
      job_title: 'Truck Driver',
      job_category_id: 25,
      employer: nil,
      availability: nil
    },
    {
      user_id: 48,
      bio: nil,
      job_title: 'Art Director',
      job_category_id: 10,
      employer: nil,
      availability: nil
    },
    {
      user_id: 49,
      bio: nil,
      job_title: 'HR Specialist',
      job_category_id: 13,
      employer: nil,
      availability: nil
    },
    {
      user_id: 50,
      bio: nil,
      job_title: 'Radiologic Technologist',
      job_category_id: 10,
      employer: nil,
      availability: nil
    },
    {
      user_id: 51,
      bio: nil,
      job_title: 'Real Estate Agent',
      job_category_id: 9,
      employer: nil,
      availability: nil
    },
    {
      user_id: 52,
      bio: nil,
      job_title: 'Public Relations Specialist',
      job_category_id: 15,
      employer: nil,
      availability: nil
    },
    {
      user_id: 53,
      bio: nil,
      job_title: 'Professional athlete',
      job_category_id: 11,
      employer: nil,
      availability: nil
    },
    {
      user_id: 54,
      bio: nil,
      job_title: 'Telemarketer',
      job_category_id: 25,
      employer: nil,
      availability: nil
    },
    {
      user_id: 55,
      bio: nil,
      job_title: 'School Counselor',
      job_category_id: 13,
      employer: nil,
      availability: nil
    },
    {
      user_id: 56,
      bio: nil,
      job_title: 'Respiratory Therapist',
      job_category_id: 5,
      employer: nil,
      availability: nil
    },
    { user_id: 57, bio: nil, job_title: 'Cashier', job_category_id: 2, employer: nil, availability: nil },
    {
      user_id: 58,
      bio: nil,
      job_title: 'Civil Engineer',
      job_category_id: 6,
      employer: nil,
      availability: nil
    },
    { user_id: 59, bio: nil, job_title: 'Drafter', job_category_id: 1, employer: nil, availability: nil },
    {
      user_id: 60,
      bio: nil,
      job_title: 'Musician',
      job_category_id: 1,
      employer: nil,
      availability: nil
    },
    { user_id: 61, bio: nil, job_title: 'Chef', job_category_id: 9, employer: nil, availability: nil },
    {
      user_id: 62,
      bio: nil,
      job_title: 'Loan Officer',
      job_category_id: 27,
      employer: nil,
      availability: nil
    },
    {
      user_id: 63,
      bio: nil,
      job_title: 'Database administrator',
      job_category_id: 22,
      employer: nil,
      availability: nil
    },
    {
      user_id: 64,
      bio: nil,
      job_title: 'Recreational Therapist',
      job_category_id: 11,
      employer: nil,
      availability: nil
    },
    {
      user_id: 65,
      bio: nil,
      job_title: 'Physician',
      job_category_id: 19,
      employer: nil,
      availability: nil
    },
    {
      user_id: 66,
      bio: nil,
      job_title: 'Court Reporter',
      job_category_id: 7,
      employer: nil,
      availability: nil
    },
    {
      user_id: 67,
      bio: nil,
      job_title: 'Firefighter',
      job_category_id: 3,
      employer: nil,
      availability: nil
    },
    { user_id: 68, bio: nil, job_title: 'Editor', job_category_id: 26, employer: nil, availability: nil },
    {
      user_id: 69,
      bio: nil,
      job_title: 'Computer Support Specialist',
      job_category_id: 21,
      employer: nil,
      availability: nil
    },
    { user_id: 70, bio: nil, job_title: 'Dentist', job_category_id: 2, employer: nil, availability: nil },
    {
      user_id: 71,
      bio: nil,
      job_title: 'Paramedic',
      job_category_id: 27,
      employer: nil,
      availability: nil
    },
    {
      user_id: 72,
      bio: nil,
      job_title: 'Medical Secretary',
      job_category_id: 10,
      employer: nil,
      availability: nil
    },
    {
      user_id: 73,
      bio: nil,
      job_title: 'Executive Assistant',
      job_category_id: 21,
      employer: nil,
      availability: nil
    },
    {
      user_id: 74,
      bio: nil,
      job_title: 'Elementary School Teacher',
      job_category_id: 15,
      employer: nil,
      availability: nil
    },
    {
      user_id: 75,
      bio: nil,
      job_title: 'Bus Driver',
      job_category_id: 17,
      employer: nil,
      availability: nil
    },
    {
      user_id: 76,
      bio: nil,
      job_title: 'Personal Care Aide',
      job_category_id: 5,
      employer: nil,
      availability: nil
    },
    {
      user_id: 77,
      bio: nil,
      job_title: 'Architect',
      job_category_id: 21,
      employer: nil,
      availability: nil
    }
  ]
                )
  puts("#{Alumnus.count} total alumni info created.")
else
  puts("#{User.count} total users created.")
end