class AddSubcategoryToQuestions < ActiveRecord::Migration[5.2]
  def change
    add_column :questions, :subcategory, :string
  end
end
