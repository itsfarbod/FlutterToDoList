import 'package:custom_switch/custom_switch.dart';
import 'package:flutter/material.dart';
import 'package:to_do_list/TaskDetails.dart';
import 'TaskModel.dart';

class TaskItem extends StatelessWidget {

  TaskItem({this.taskModel, this.changeIsDone, this.deleteTask});

  final TaskModel taskModel;
  final Function changeIsDone;
  final Function deleteTask;



  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10 , right: 10 , left: 10),
      decoration: BoxDecoration(
        color: taskModel.isDone ? Colors.greenAccent : taskModel.time.isBefore(DateTime.now()) ? Colors.orange : Colors.white,
        border: Border.all(
          width: 5,
          color: Colors.green,
        ),
        borderRadius: BorderRadius.all(Radius.circular(20)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: ListTile(
        onTap: () {
          Navigator.push(
              context,
            MaterialPageRoute(
                builder: (_) {
                  return TaskDetails(taskModel: taskModel,changeIsDone: changeIsDone,);
                }
            )
          );
        },
        title: Text(taskModel.title.length < 15 ? taskModel.title : taskModel.title.substring(0 , 15) + "..."),
        subtitle: Text(taskModel.description.length < 20 ? taskModel.description : taskModel.description.substring(0 , 20) + "..."),
        trailing: Container(
          height: 50,
          width: 120,
          child: Row(
            children: [
              Container(
                child: Text(taskModel.time.toString().substring(0 , 10)),
              ),
              GestureDetector(
                onTap: () {
                  deleteTask(taskModel);
                },
                child: Icon(Icons.delete , color: Colors.red,),
              ),
              GestureDetector(
                onTap: () {
                  changeIsDone();
                },
                child: taskModel.isDone
                    ? Icon(
                        Icons.check_box,
                        color: Colors.green,
                      )
                    : Icon(Icons.check_box_outline_blank),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
