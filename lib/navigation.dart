import 'package:Project/StudentProfile.dart';
import 'package:Project/models/StudentModel.dart';
import 'package:Project/studentDashboard.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class Navigation extends StatefulWidget {
  final StudentModel student;
  Navigation({Key key, @required this.student}) : super(key: key);
  @override
  _NavigationState createState() => _NavigationState(this.student);
}

class _NavigationState extends State<Navigation> {
  int pageIndex = 0;
  static StudentModel student;
  _NavigationState(StudentModel s) {
    student = s;
  }
  final StudentProfile _profile = StudentProfile(student: student,);
  final StudentDashboard _dashboard = StudentDashboard(student: student,);

  Widget _showPage = new StudentProfile(student: student,);

  Widget _pageChooser(int page) {
    switch (page) {
      case 0:
        return _profile;
        break;
      case 1:
        return _dashboard;
        break;
      default:
        return new Container(
          child: new Center(
            child: new Text("No data found by page chooser"),
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        index: pageIndex,
        backgroundColor: Colors.white,
        color: Colors.black,
        items: <Widget>[
          Icon(
            Icons.person,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.dashboard,
            size: 30,
            color: Colors.white,
          ),
        ],
        animationDuration: Duration(
          milliseconds: 400,
        ),
        onTap: (int tappedIndex) {
          setState(() {
            _showPage = _pageChooser(tappedIndex);
          });
        },
      ),
      body: Container(
        child: Center(
          child: _showPage,
        ),
      ),
    );
  }
}
