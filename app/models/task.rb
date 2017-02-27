class Task < ApplicationRecord
  belongs_to :state, :class_name => :TaskState
  belongs_to :type, :class_name => :TaskType
  belongs_to :priority, :class_name => :TaskPriority
  has_many :links, inverse_of: :task

  accepts_nested_attributes_for :links

  before_validation :default_values

  validates :name, presence: true

  protected
    def default_values
      unless self.priority_id?
        self.priority = TaskPriority.where(name: "medium").first
      end

      unless self.state_id?
        self.state = TaskState.where(name: "backlog").first
      end

      unless self.type_id?
        self.type = TaskType.where(name: "task").first
      end
    end
end
