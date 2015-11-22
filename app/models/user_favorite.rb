class UserFavorite < ActiveRecord::Base
  belongs_to :user
  belongs_to :favorite, class_name: "User"
end

# == Schema Information
#
# Table name: user_favorites
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  favorite_id :integer
#  created_at  :datetime
#  updated_at  :datetime
#
