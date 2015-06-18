class ChangeNametoPolish < ActiveRecord::Migration
 def change
     rename_column :vocabularies, :name, :polish
  end
end
