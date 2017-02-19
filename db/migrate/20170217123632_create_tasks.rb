class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.string :name
      t.text :description
      t.references :state, foreign_key: { to_table: :task_states}
      t.boolean :archived, default: false
      t.references :type, foreign_key: { to_table: :task_types}
      t.references :priority, foreign_key: { to_table: :task_priorities}
      t.date :date

      t.timestamps
    end
  end
end
