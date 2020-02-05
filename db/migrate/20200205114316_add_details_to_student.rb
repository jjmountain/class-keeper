class AddDetailsToStudent < ActiveRecord::Migration[5.2]
  def change
    add_column :students, :given_name_furigana, :string
    add_column :students, :family_name_furigana, :string
    add_column :students, :given_name_kanji, :string
    add_column :students, :family_name_kanji, :string
    add_column :students, :year_enrolled, :string
    add_column :students, :faculty, :string
  end
end
