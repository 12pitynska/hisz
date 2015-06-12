class AddAttachmentImageToTheories < ActiveRecord::Migration
  def self.up
    change_table :theories do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :theories, :image
  end
end
