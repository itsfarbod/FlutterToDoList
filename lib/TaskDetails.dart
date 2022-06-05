import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:to_do_list/TaskModel.dart';
import 'package:custom_switch/custom_switch.dart';

class TaskDetails extends StatefulWidget {
  const TaskDetails({Key key, this.taskModel, this.changeIsDone}) : super(key: key);

  final TaskModel taskModel;
  final Function changeIsDone;

  @override
  State<TaskDetails> createState() => _TaskDetailsState();
}

class _TaskDetailsState extends State<TaskDetails> {

  bool value = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Details"),
        ),
        body: Center(
          child: Container(
            padding: EdgeInsets.only(top: 20),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  width: 300,
                  height: 45,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                    border: Border.all(
                      width: 5,
                      color: Colors.green,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: SingleChildScrollView(scrollDirection: Axis.horizontal,child: Text(widget.taskModel.title)),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  padding: EdgeInsets.all(10),
                  width: 300,
                  height: 400,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                    border: Border.all(
                      width: 5,
                      color: Colors.green,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: SizedBox(
                      width: 250, child: SingleChildScrollView(scrollDirection:Axis.vertical,child: Text(widget.taskModel.description))),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.only(top: 20),
                  width: 300,
                  height: 45,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                    border: Border.all(
                      width: 5,
                      color: Colors.green,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child:
                      Text(widget.taskModel.time.toString().substring(0, 10)),
                ),
                Container(
                  padding: EdgeInsets.only(top: 20),
                  child: CustomSwitch(
                    value: widget.taskModel.isDone,
                    activeColor: Colors.green,
                    onChanged: (value) {
                      widget.changeIsDone();
                    },
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
