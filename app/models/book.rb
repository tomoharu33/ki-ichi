# == Schema Information
#
# Table name: books
#
#  id         :bigint           not null, primary key
#  body       :text
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#
class Book < ApplicationRecord
  belongs_to :user
  has_one_attached :book_image
  has_many :favorites, dependent: :destroy

  with_options presence: true do
    validates :title
    # API経由で登録する際に、bodyがnullの場合があるため、validationを解除する
    # validates :body
  end
end
