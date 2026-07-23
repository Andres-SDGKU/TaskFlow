import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = TaskListViewModel()
    @State private var newTaskTitle: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    TextField("New task", text: $newTaskTitle)
                        .textFieldStyle(.roundedBorder)
                        .accessibilityIdentifier("add_task_button")
                    Button("Add") {
                        viewModel.addTask(title: newTaskTitle)
                        newTaskTitle = ""
                    }
                    .accessibilityIdentifier("add_task_button")
                }
                .padding()
                
                List {
                    ForEach(viewModel.tasks) { task in
                        HStack {
                            Text(task.title)
                            Spacer()
                            if task.isCompleted {
                                Image(systemName: "checkmark.circle.fill")
                            }
                        }
                        .onTapGesture {
                            viewModel.toggleCompletion(id: task.id)
                        }
                    }
                    .onDelete { indexSet in
                        indexSet.forEach { viewModel.removeTask(at: $0) }
                    }
                }
                
                Text("Completed: \(viewModel.completedCount)/\(viewModel.tasks.count)")
                    .font(.footnote)
                    .padding(.bottom)
            }
            .navigationTitle("TaskFlow")
        }
    }
}

#Preview {
    ContentView()
}
