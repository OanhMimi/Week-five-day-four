# == Schema Information
#
# Table name: chirps
#
#  id         :bigint           not null, primary key
#  body       :text             not null
#  user_id    :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Chirp < ApplicationRecord
    validates :body, :user_id, presence: true
    validate: body_too_long

    belongs_to :user,
        pimary_key: :id #relates to the columns, can have symbols or strings
        foreign_key: :user_id
        class_name: :User #capitalize cause relates to the class


    def body_too_long
        if body && body.length > 140
            errors.add(:body, 'too long')
        end
    end

end
