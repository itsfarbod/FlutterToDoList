import 'package:flutter/material.dart';
import 'package:to_do_list/ToDoList.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();


}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  _navigateToHome()async{
    await Future.delayed(Duration(milliseconds: 2000));
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ToDoList()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.all(25),
          decoration: BoxDecoration(
            border: Border.all(
              width: 20,
              color: Colors.green,
            ),
            borderRadius: BorderRadius.all(Radius.circular(50)),
          ),
          child: Text("To Do List" , style: TextStyle(
            fontSize: 50 ,
            fontWeight: FontWeight.bold,
          ),),
        ),
      ),
    );
  }
}
