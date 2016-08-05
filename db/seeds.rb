# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
["Albany Area Hospital and Medical Center","Mayo Clinic Health System - Albert Lea",
"Ridgeview Sibley Medical Center",
"Mayo Clinic Health System - Austin",
"LakeWood Health Center",
"Sanford Health",
"Essentia Health St. Joseph's Medical Center",
"Buffalo Hospital",
"Fairview Ridges Hospital",
"Cambridge Medical Center",
"Mayo Clinic Health System - Cannon Falls",
"Community Memorial Hospital",
"Mercy Hospital of Coon Rapids",
"Riverview Health",
"Cuyuna Regional Medical Center",
"Essentia Health St. Mary's Hospital",
"Essentia Health St. Mary's Medical Center",
"Fairview Southdale Hospital",
"Mayo Clinic Health System - Fairmont",
"District One Hospital",
"Firstcare Health",
"Unity Hospital",
"Glencoe Regional Health Services",
"Essentia Health Holy Trinity Hospital",
"Kittson Memorial Hospital",
"Regina Hospital",
"University Medical Center - Mesabi",
"Hutchinson Health Hospital",
"Rainy Lake Medical Center",
"Mayo Clinic Health System - Lake City",
"Meeker Memorial Hospital",
"St. Gabriel Hospital",
"Long Prairie Memorial Hospital and Home-CentraCare",
"Madelia Community Hospital",
"Mayo Clinic Health System - Mankato"].each do | hospital_name |

  hospital = Hospital.create(:name => hospital_name)

  (rand(20) + 5).times do 
    hospital.seed_data
  end

end

