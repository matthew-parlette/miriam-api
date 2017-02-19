# TaskPriority
if TaskPriority.count == 0
  TaskPriority.create(id: 1, name: "urgent")
  TaskPriority.create(id: 2, name: "high")
  TaskPriority.create(id: 3, name: "medium")
  TaskPriority.create(id: 4, name: "low")
  TaskPriority.create(id: 5, name: "none")
end

# TaskState
if TaskState.count == 0
  TaskState.create(id: 1, name: "icebox")
  TaskState.create(id: 2, name: "backlog")
  TaskState.create(id: 3, name: "working")
  TaskState.create(id: 4, name: "waiting")
  TaskState.create(id: 5, name: "done")
end

# TaskType
if TaskType.count == 0
  TaskType.create(id: 1, name: "incident")
  TaskType.create(id: 2, name: "problem")
  TaskType.create(id: 3, name: "question")
  TaskType.create(id: 4, name: "task")
  TaskType.create(id: 5, name: "document")
  TaskType.create(id: 6, name: "follow-up")
end
