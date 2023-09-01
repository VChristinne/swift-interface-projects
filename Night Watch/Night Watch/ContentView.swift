import SwiftUI

struct ContentView: View {
	@State private var singleSelection: UUID?
	@State private var newTaskName = ""
	@State private var isAddingTaskSheetPresented = false
	
	@State private var isNightlyTasksActive = false
	@State private var isWeeklyTasksActive = false
	@State private var isMonthlyTasksActive = false

	@Environment(\.editMode) private var editMode
	
	struct Task: Hashable, Identifiable {
		var name: String
		var id = UUID()
	}
	
	struct TasksToDo: Identifiable {
		var name: String
		var tasks: [Task]
		var id = UUID()
	}
	
	@State private var tasksToDo: [TasksToDo] = [
		TasksToDo(name: "Nightly",
				  tasks: [Task(name: "Check all windows"),
						  Task(name: "Check all doors"),
						  Task(name: "Check that the safe is locked"),
						  Task(name: "Check the mailbox"),
						  Task(name: "Inspect security cameras"),
						  Task(name: "Clear ice from sidewalks")]),
		TasksToDo(name: "Weekly",
				  tasks: [Task(name: "Check inside all vacant rooms"),
						  Task(name: "Walk the perimeter of property")]),
		TasksToDo(name: "Monthly",
				  tasks: [Task(name: "Test security alarm"),
						  Task(name: "Test motion detectors"),
						  Task(name: "Test smoke alarms")]),
	]

	// MARK: NAVIGATION VIEW
	var body: some View {
		NavigationView {
			List(selection: $singleSelection) {
				ForEach(tasksToDo.indices, id: \.self) { typeIndex in
					Section(header:
								Button(action: {
						switch tasksToDo[typeIndex].name {
							case "Nightly":
								isNightlyTasksActive = true
							case "Weekly":
								isWeeklyTasksActive = true
							case "Monthly":
								isMonthlyTasksActive = true
							default:
								break
						}
					}) {
						Text("\(tasksToDo[typeIndex].name) Tasks")
							.font(.subheadline)
							.fontWeight(.bold)
							.foregroundColor(Color.indigo)
					}
					) {
						ForEach(tasksToDo[typeIndex].tasks.indices, id: \.self) { taskIndex in
							Text(tasksToDo[typeIndex].tasks[taskIndex].name)
						}
						.onDelete { indices in
							tasksToDo[typeIndex].tasks.remove(atOffsets: indices)
						}
						.onMove { sourceIndices, destinationIndex in
							tasksToDo[typeIndex].tasks.move(fromOffsets: sourceIndices, toOffset: destinationIndex)
						}
					}
				}
				
			}
			.navigationTitle("Night Watch Tasks")
			.toolbar {
				EditButton()
					.foregroundColor(Color.indigo)
			}
			.sheet(isPresented: $isAddingTaskSheetPresented) {
				AddTaskView(tasksToDo: $tasksToDo)
			}
			.background(
				NavigationLink("", destination: NightlyTasksView(tasksToDo: $tasksToDo), isActive: $isNightlyTasksActive)
					.opacity(0)
			)
			.background(
				NavigationLink("", destination: WeeklyTasksView(tasksToDo: $tasksToDo), isActive: $isWeeklyTasksActive)
					.opacity(0)
			)
			.background(
				NavigationLink("", destination: MonthlyTasksView(tasksToDo: $tasksToDo), isActive: $isMonthlyTasksActive)
					.opacity(0)
			)
		}
	}
}

// MARK: ADD TASK
struct AddTaskView: View {
	@Binding var tasksToDo: [ContentView.TasksToDo]
	@State private var newTaskName = ""
	@State private var selectedSectionIndex = 0
	
	var body: some View {
		NavigationView {
			Form {
				Picker("Section", selection: $selectedSectionIndex) {
					ForEach(tasksToDo.indices, id: \.self) { index in
						Text(tasksToDo[index].name).tag(index)
					}
				}
				TextField("Description", text: $newTaskName)
					.keyboardType(.default)
			}
			.navigationTitle("New Task")
			.navigationBarItems(trailing: Button("Add") {
				guard !newTaskName.isEmpty else { return }
				tasksToDo[selectedSectionIndex].tasks.append(ContentView.Task(name: newTaskName))
				newTaskName = ""
			})
		}
	}
}

// MARK: NIGHTLY TASKS
struct NightlyTasksView: View {
	@Binding var tasksToDo: [ContentView.TasksToDo]
	@State private var isAddingTaskSheetPresented = false
	
	var body: some View {
		List {
			ForEach(tasksToDo[0].tasks.indices, id: \.self) { taskIndex in
				Text(tasksToDo[0].tasks[taskIndex].name)
			}
		}
		.navigationTitle("Nightly Tasks")
		.toolbar {
			ToolbarItem(placement: .navigationBarTrailing) {
				Button(action: {
					isAddingTaskSheetPresented.toggle()
				}) {
					Label("Add Task", systemImage: "plus")
				}
			}
		}
		.sheet(isPresented: $isAddingTaskSheetPresented) {
			AddTaskView(tasksToDo: $tasksToDo)
		}
	}
}

// MARK: WEEKLY TASKS VIEW
struct WeeklyTasksView: View {
	@Binding var tasksToDo: [ContentView.TasksToDo]
	@State private var isAddingTaskSheetPresented = false
	
	var body: some View {
		List {
			ForEach(tasksToDo[1].tasks.indices, id: \.self) { taskIndex in
				Text(tasksToDo[1].tasks[taskIndex].name)
			}
		}
		.navigationTitle("Weekly Tasks")
		.toolbar {
			ToolbarItem(placement: .navigationBarTrailing) {
				Button(action: {
					isAddingTaskSheetPresented.toggle()
				}) {
					Label("Add Task", systemImage: "plus")
				}
			}
		}
		.sheet(isPresented: $isAddingTaskSheetPresented) {
			AddTaskView(tasksToDo: $tasksToDo)
		}
	}
}

// MARK: MONTHLY TASKS VIEW
struct MonthlyTasksView: View {
	@Binding var tasksToDo: [ContentView.TasksToDo]
	@State private var isAddingTaskSheetPresented = false
	
	var body: some View {
		List {
			ForEach(tasksToDo[2].tasks.indices, id: \.self) { taskIndex in
				Text(tasksToDo[2].tasks[taskIndex].name)
			}
		}
		.navigationTitle("Monthly Tasks")
		.toolbar {
			ToolbarItem(placement: .navigationBarTrailing) {
				Button(action: {
					isAddingTaskSheetPresented.toggle()
				}) {
					Label("Add Task", systemImage: "plus")
				}
			}
		}
		.sheet(isPresented: $isAddingTaskSheetPresented) {
			AddTaskView(tasksToDo: $tasksToDo)
		}
	}
}

// MARK: PREVIEW
struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
