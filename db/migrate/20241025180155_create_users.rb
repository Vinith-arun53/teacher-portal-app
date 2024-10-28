class CreateUsers < ActiveRecord::Migration[7.2]
  def change
    create_table :users, id: :uuid do |t|
      t.string :u_name
      t.string :u_user_name
      t.text :password
      t.text :u_role, default: "student"
      t.text :password_digest
      t.text :confirm_password
      t.references :created_by, foreign_key: { to_table: :users }, type: :uuid, index: true, null: true

      t.timestamps
    end
    create_table :student_subjects, id: :uuid do |t|
      t.string :s_name
      t.string :s_student_name
      t.integer :s_mark
      t.string :user_id
    end
  end
end
