# == Schema Information
#
# Table name: users
#
#  id            :bigint           not null, primary key
#  username      :string           not null
#  email         :string           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  age           :integer          not null
#  favorite_coin :string           not null
#
class User < ApplicationRecord
    validates :username, :email, :age, :favorite_coin, presence: true
    validates :username, :email, uniqueness: true, presence: true

    has_many :chirps,
        primary_key: :id,
        foreign_key: :user_id #same foreign key as chirp table even tho this table doesnt have foreign key 
        class_name: :Chirp

end
