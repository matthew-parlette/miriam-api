class CreateTaskStates < ActiveRecord::Migration[5.0]
  def change
    create_table :task_states do |t|
      t.string :name

      t.timestamps
    end
  end
end
