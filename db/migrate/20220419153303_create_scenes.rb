class CreateScenes < ActiveRecord::Migration[7.0]
  def change
    create_table :scenes do |t|
      t.string :slug
      t.string :title
      t.string :description

      t.timestamps
    end
  end
end
