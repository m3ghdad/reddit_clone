# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  url        :string
#  content    :text
#  sub_id     :integer          not null
#  author_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Post < ApplicationRecord
  validates :title, presence: true

  belongs_to :author,
    primary_key: :id,
    foreign_key: :author_id,
    class_name: 'User',
    inverse_of: :posts

  # remove column for sub_id
  # belongs_to :sub,
  #     primary_key: :id,
  #     foreign_key: :sub_id,
  #     class_name: 'Sub'

end
