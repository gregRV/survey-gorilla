class InitialSetup < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
    end

    create_table :surveys do |t|
      t.string :title
      t.string :description
      t.references :creator
    end

    create_table :questions do |t|
      t.string :text
      t.references :survey
    end

    create_table :choices do |t|
      t. string :text
      t.references :question
    end

    create_table :answers do |t|
      t.references :user
      t.references :choice
    end

    add_index(:answers, [:user_id, :choice_id], unique: true)

  end
end
