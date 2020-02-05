require 'pry'

namespace :import do
  desc "Import students from csv"
  task students: :environment do 
    counter = 0
    filename = File.join Rails.root, "students.csv"
    CSV.foreach(filename, headers: true) do |row|
      kanji_name_array = row['学生氏名'].split('　')
      furigana_name_array = row['フリガナ'].split('　')
      english_name_array = row['Ｎａｍｅ'].split(' ')
      email = "#{row['学籍番号']}@s.obirin.ac.jp".downcase!
      year = row[0]
      student_hash = {
        'given_name': english_name_array[1],
        'family_name': english_name_array[0],
        'given_name_furigana': furigana_name_array[1],
        'family_name_furigana': furigana_name_array[0],
        'given_name_kanji': kanji_name_array[1],
        'family_name_kanji': kanji_name_array[0],
        'student_number': row['学籍番号'],
        'year_enrolled': year,
        'faculty': row['所属'].strip,
        'email': email,
        'password': row['学籍番号']
      }
      student = find_or_create_by!(student_number: row['学籍番号'], given_name: english_name_array[1], family_name: english_name_array[0])
      student.update_attributes(student_hash)
      puts "#{row['Ｎａｍｅ']} - #{student.errors.full_messages.join(',')}" if student.errors.any?
      counter += 1 if student.persisted?
    end
    puts "Created #{counter} students!"
  end
end