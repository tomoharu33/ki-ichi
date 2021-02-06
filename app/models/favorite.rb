# == Schema Information
#
# Table name: favorites
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  book_id    :integer
#  user_id    :integer
#
class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :book

  validates_uniqueness_of :book_id, scope: :user_id
end
