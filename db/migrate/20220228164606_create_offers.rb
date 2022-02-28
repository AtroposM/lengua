class CreateOffers < ActiveRecord::Migration[6.1]
  def change
    create_table :offers do |t|
      t.string :language
      t.string :level
      t.string :date
      t.string :duration
      t.references :user, null: false, foreign_key: true

      t.timestamps

    end
  end
end
