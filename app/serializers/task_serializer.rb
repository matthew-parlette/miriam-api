class TaskSerializer < ActiveModel::Serializer
  attributes :id, :name, :description,
    :state_id, :type_id, :priority_id,
    :date, :archived, :links
end
