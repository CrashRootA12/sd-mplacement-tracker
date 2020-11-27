import 'package:Project/StudentProfile.dart';
import 'package:Project/models/StudentModel.dart';
import 'package:Project/studentDashboard.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class Navigation extends StatefulWidget {
  final StudentModel student;
  Navigation({Key key, @required this.student}) : super(key: key) {
    print("Reached Nav");
  }
  @override
  _NavigationState createState() {
    print('printing here ' + student.name);
    return _NavigationState();
  }
}

class _NavigationState extends State<Navigation> {
  int pageIndex = 0;
  Widget _showPage;

  Widget _pageChooser(int page) {
    switch (page) {
      case 0:
        return StudentProfile(student: widget.student);
        break;
      case 1:
        return StudentDashboard(student: widget.student);
        break;
      default:
        return new Container(
          child: new Center(
            child: new Text("No data found by page chooser"),
          ),
        );
    }
  }

  bool once = true;
  @override
  Widget build(BuildContext context) {
    if (once) {
      _showPage = StudentProfile(student: widget.student);
      once = false;
    }
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
