import "package:flutter/material.dart";

import 'AddTask.dart';
import 'TaskItem.dart';
import 'TaskModel.dart';

class ToDoList extends StatefulWidget {
  @override
  State<ToDoList> createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  List<TaskModel> tasksList = [
    TaskModel("Task1", "Description1", true, DateTime.now()),
    TaskModel("Task2", "Description2", false, DateTime.now()),
    TaskModel("Task3", "Description3", true, DateTime.now()),
    TaskModel("Task4", "Description4", false, DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    void changeIsDone(int index) {
      bool currState = tasksList[index].isDone;
      setState(() {
        tasksList[index].setIsDone(!currState);
      });
    }

    void sortTasks() {
      for (int i = 0; i < tasksList.length - 1; i++)
        for (int j = 0; j < tasksList.length - i - 1; j++)
          if (tasksList[j].time.isAfter(tasksList[j + 1].time)) {
            TaskModel temp = tasksList[j];
            tasksList[j] = tasksList[j + 1];
            tasksList[j + 1] = temp;
          }
    }

    void addTask(TaskModel taskModel) {
      setState(() {
        tasksList.add(taskModel);
        sortTasks();
      });
    }

    void deleteTask(TaskModel taskModel) {
      setState(() {
        tasksList.remove(taskModel);
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("ToDo List"),
      ),
      body: Container(
        child: tasksList.length == 0
            ? Center(
                child: Container(
                  margin: EdgeInsets.only(top: 250),
                  child: Column(
                    children: [
                      Text(
                        "Nothing Here!",
                        style: TextStyle(fontSize: 40),
                      ),
                      Text(
                        "Press on Add to create a task!",
                        style: TextStyle(fontSize: 20),
                      )
                    ],
                  ),
                ),
              )
            : ListView.builder(
                itemCount: tasksList.length,
                itemBuilder: (contex, index) {
                  return TaskItem(
                      taskModel: tasksList[index],
                      deleteTask: deleteTask,
                      changeIsDone: () => changeIsDone(index));
                }),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        label: const Text("Add"),
        icon: const Icon(Icons.add),
        backgroundColor: Colors.green,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) {
                return AddTask(
                  addNewTask: addTask,
                );
              },
            ),
          );
        },
      ),
    );
  }
}
