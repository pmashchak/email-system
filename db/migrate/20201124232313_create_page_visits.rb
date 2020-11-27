class CreatePageVisits < ActiveRecord::Migration[6.0]
  def change
    create_table :page_visits do |t|
      t.string :host
      t.text :path
      t.references :user
      t.timestamps
    end
  end
end
