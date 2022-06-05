import 'package:flutter/material.dart';
import 'package:to_do_list/TaskModel.dart';

class AddTask extends StatefulWidget {
  const AddTask({Key key, this.addNewTask}) : super(key: key);

  final Function addNewTask;

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  TextEditingController titleC;
  TextEditingController descC;

  DateTime currentDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime pickedDate = await showDatePicker(
        context: context,
        initialDate: currentDate,
        firstDate: DateTime(2015),
        lastDate: DateTime(2050));
    if (pickedDate != null && pickedDate != currentDate)
      setState(() {
        currentDate = pickedDate;
      });
  }

  @override
  void initState() {
    // TODO: implement initState
    titleC = TextEditingController();
    descC = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    titleC.dispose();
    descC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Add New Task"),
      ),
      body: Container(
        padding: const EdgeInsets.all(50),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(hintText: "Title"),
              controller: titleC,
              keyboardType: TextInputType.text,
            ),
            SizedBox(
              height: 250,
              child: TextField(
                decoration: const InputDecoration(hintText: "Description"),
                controller: descC,
                expands: true,
                maxLines: null,
                keyboardType: TextInputType.text,
              ),
            ),
            Container(
                padding: EdgeInsets.only(top: 20),
                child: Text(currentDate.toString().substring(0,10))),
            ElevatedButton(
              onPressed: () => _selectDate(context),
              child: Text('Select date'),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 40, horizontal: 30),
              height: 40,
              width: 80,
              child: ElevatedButton(
                onPressed: () {
                  String title = titleC.text;
                  String desc = descC.text;
                  TaskModel task = TaskModel(title, desc, false , currentDate);
                  widget.addNewTask(task);
                  titleC.clear();
                  descC.clear();
                  Navigator.pop(context);
                },
                child: const Text("Add"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
