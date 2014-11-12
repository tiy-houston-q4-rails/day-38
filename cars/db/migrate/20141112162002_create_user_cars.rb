class CreateUserCars < ActiveRecord::Migration
  def change
    create_table :user_cars do |t|
      t.references :user, index: true
      t.references :car, index: true

      t.timestamps
    end
  end
end
