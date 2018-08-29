class CreateResults < ActiveRecord::Migration[5.2]
  def change
    create_table :results do |t|
      t.references :exam, foreign_key: true

      t.timestamps
    end
  end
end
