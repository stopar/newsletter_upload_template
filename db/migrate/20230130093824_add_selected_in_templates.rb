class AddSelectedInTemplates < ActiveRecord::Migration[7.0]
  def change
    add_column  :templates, :selected, :boolean, default: false
  end
end
