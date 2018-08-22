class AddNumberOfBadgesToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :number_of_badges, :integer
  end
end
