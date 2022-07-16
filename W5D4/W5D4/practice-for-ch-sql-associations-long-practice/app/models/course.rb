# == Schema Information
#
# Table name: courses
#
#  id            :bigint           not null, primary key
#  name          :string           not null
#  prereq_id     :bigint
#  instructor_id :bigint           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class Course < ApplicationRecord
    belongs_to :prereq,
        class_name: 'Course',
        foreign_key: :prereq_id,
        primary_key: :id,
        optional: true

    belongs_to :instructor,
        class_name: 'User',
        foreign_key: :instructor_id,
        primary_key: :id

    has_many :enrolled_courses,
        through: :enrollments,
        source: :course,
        dependent: :destroy


    has_many :enrolled_students,
        through: :enrollments,
        source: :student,
        dependent: :destroy



end
