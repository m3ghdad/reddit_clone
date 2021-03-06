# == Schema Information
#
# Table name: subs
#
#  id           :integer          not null, primary key
#  title        :string           not null
#  description  :text             not null
#  modetator_id :integer          not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Sub < ApplicationRecord
  validates :title, :description, presence: true

  belongs_to :moderator,
    primary_key: :id,
    foreign_key: :modetator_id,
    class_name: 'User',
    inverse_of: :subs

  # posts and subs are connected through a seperate joined table
  # has_many :posts,
  #   primary_key: :id,
  #   foreign_key: :sub_id,
  #   class_name: 'Post'
end
