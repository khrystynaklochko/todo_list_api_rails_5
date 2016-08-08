class TaskSerializer < ActiveModel::Serializer
  attributes :id, :title, :description

  belongs_to :user

  link(:self) { task_url(object) }
end
