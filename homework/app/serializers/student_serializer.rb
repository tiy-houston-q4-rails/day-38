class StudentSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :email

  has_one :cohort

  embed :ids, include: true
end
