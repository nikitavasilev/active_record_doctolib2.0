# Database with Rails - Active Record - Doctolib 2.0

This work was done as a project for [The Hacking Project Bootcamp](https://www.thehackingproject.org/).
The goal was to learn the basics of the Database with Rails and build an SQL database of a doctolib2.0 app with the main functionalities of doctolib register as a patient, take appointments with doctors which have different specialities in your city.

## Requirements

You need to run ruby 2.5.1, rails 5.2.1 and bundler installed on your computer.

1. First of all `git clone the repo`
2. Run `$ cd active_record_doctolib2.0`
3. Run `$ bundle install`
4. Run `$ rake db:reset` which gonna clean all the cells of our database, and create brand new tables along with our `seeds.rb` file
5. To play with the database run `$ rails console`
6. To check the content of each table, run `sqlite3 db/development.sqlite3` and then run:
	* `.mode column` for better readability
	* `.headers on` to show headers cells in our tables
	* `.tables` to see the list of all tables
	* `SELECT * FROM replace_it_with_the_name_of_a_table;` this command actually shows you the table that you select (don't forget the semicolon at the end!)
	* `.width` if you want to change the width of the columns for better readability. For example, if you wand to set the width of the first column to 20px and the 2nd column to 50px, run `.width 20 50`

### This is the database schema of our app:
```ruby
ActiveRecord::Schema.define(version: 2018_10_25_161433) do

  create_table "appointments", force: :cascade do |t|
    t.datetime "date"
    t.integer "doctor_id"
    t.integer "patient_id"
    t.integer "city_id"
    t.index ["city_id"], name: "index_appointments_on_city_id"
    t.index ["doctor_id"], name: "index_appointments_on_doctor_id"
    t.index ["patient_id"], name: "index_appointments_on_patient_id"
  end

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "doctors", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.integer "postal_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "city_id"
    t.index ["city_id"], name: "index_doctors_on_city_id"
  end

  create_table "doctors_specialities", id: false, force: :cascade do |t|
    t.integer "doctor_id"
    t.integer "speciality_id"
    t.index ["doctor_id"], name: "index_doctors_specialities_on_doctor_id"
    t.index ["speciality_id"], name: "index_doctors_specialities_on_speciality_id"
  end

  create_table "patients", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "city_id"
    t.index ["city_id"], name: "index_patients_on_city_id"
  end

  create_table "specialities", force: :cascade do |t|
    t.string "name"
    t.integer "doctor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["doctor_id"], name: "index_specialities_on_doctor_id"
  end
end
```

# Contributions

This project was build with the help of:
* [Nikita Vasilev](https://github.com/nikitavasilev)
* [Arthur Mansuy](https://github.com/tutus06)
* [Nathaniel Debache](https://github.com/Natdenice)
* [Thomas Charvet](https://github.com/TomacTh)
* [Ysaline Macé](https://github.com/Ysalien)

## Contact

Problems or questions? File an issue at [GitHub](https://github.com/nikitavasilev/active_record_doctolib2.0/issues).