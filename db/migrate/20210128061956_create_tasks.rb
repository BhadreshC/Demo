class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :task_list
      t.date :completion
      t.boolean :done
      t.belongs_to :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
