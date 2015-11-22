class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :image, ImageUploader

  belongs_to :category

  scope :vegan, -> (is_veg) { where is_veg: is_veg }
  scope :vegans, -> { where is_veg: true }
end

# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  status                 :text
#  weight                 :integer
#  height                 :integer
#  is_veg                 :boolean
#  drink                  :boolean
#  dob                    :date
#  category_id            :integer
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  image                  :string(255)
#
