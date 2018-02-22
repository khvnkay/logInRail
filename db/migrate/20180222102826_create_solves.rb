class CreateSolves < ActiveRecord::Migration[5.1]
  def change
    create_table :solves do |t|

      t.timestamps
    end
  end
end
