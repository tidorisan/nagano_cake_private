class ChangeMemberStatusOfMembers < ActiveRecord::Migration[5.2]
  def up
  		change_column :members, :member_status, :boolean, default: false
  end

  def down
  		change_column :members, :member_status
  end
end