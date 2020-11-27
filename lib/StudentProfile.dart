import 'package:Project/models/StudentModel.dart';
import 'package:flutter/material.dart';

import 'editStudentDetail.dart';

class StudentProfile extends StatefulWidget {
  final StudentModel student;
  StudentProfile({Key key, @required this.student}) : super(key: key) {
    print('StudentProfile ' + student.name);
  }
  @override
  _StudentProfileState createState() => _StudentProfileState(student: student);
}

class _StudentProfileState extends State<StudentProfile> {
  StudentModel student;

  _StudentProfileState({this.student}) {
    print("StateOfProfile " + student.name);
  }
  Widget _buildName() {
    print(student.name);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Name',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
            fontFamily: 'Schyler',
          ),
        ),
        SizedBox(
          height: 0,
        ),
        Container(
          alignment: Alignment.centerLeft,
          height: 60.0,
          child: Text(
            this.student.name,
            style: TextStyle(
                fontSize: 30,
                fontFamily: 'Schyler',
                fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  Widget _buildRollNo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Roll Number',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
            fontFamily: 'Schyler',
          ),
        ),
        SizedBox(
          height: 0,
        ),
        Container(
          alignment: Alignment.centerLeft,
          height: 60.0,
          child: Text(
            student.rollNumber.toString(),
            style: TextStyle(
                fontSize: 30,
                fontFamily: 'Schyler',
                fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  Widget _buildClassX() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Class X',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
            fontFamily: 'Schyler',
          ),
        ),
        SizedBox(
          height: 0,
        ),
        Container(
          alignment: Alignment.centerLeft,
          height: 60.0,
          child: Text(
            student.tenth.toString(),
            style: TextStyle(
                fontSize: 30,
                fontFamily: 'Schyler',
                fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  Widget _buildClassXII() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Class XII',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
            fontFamily: 'Schyler',
          ),
        ),
        SizedBox(
          height: 0,
        ),
        Container(
          alignment: Alignment.centerLeft,
          height: 60.0,
          child: Text(
            student.twelfth.toString(),
            style: TextStyle(
                fontSize: 30,
                fontFamily: 'Schyler',
                fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  Widget _buildGrad() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Graduation',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
            fontFamily: 'Schyler',
          ),
        ),
        SizedBox(
          height: 0,
        ),
        Container(
          alignment: Alignment.centerLeft,
          height: 60.0,
          child: Text(
            student.cgpa.toString(),
            style: TextStyle(
                fontSize: 30,
                fontFamily: 'Schyler',
                fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  Widget _buildCourse() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Course',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
            fontFamily: 'Schyler',
          ),
        ),
        SizedBox(
          height: 0,
        ),
        Container(
          alignment: Alignment.centerLeft,
          height: 60.0,
          child: Text(
            student.course,
            style: TextStyle(
                fontSize: 30,
                fontFamily: 'Schyler',
                fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90,
        title: Text(
          "Profile",
          style: TextStyle(
            color: Colors.white,
            fontSize: 30.0,
            fontFamily: 'Schyler',
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: Stack(
        children: <Widget>[
          Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.white,
          ),
          Container(
            height: double.infinity,
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: 40,
                vertical: 40.0,
              ),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    _buildName(),
                    SizedBox(
                      height: 20,
                    ),
                    _buildRollNo(),
                    SizedBox(
                      height: 20,
                    ),
                    _buildClassX(),
                    SizedBox(
                      height: 20,
                    ),
                    _buildClassXII(),
                    SizedBox(
                      height: 20,
                    ),
                    _buildGrad(),
                    SizedBox(
                      height: 20,
                    ),
                    _buildCourse(),
                    SizedBox(
                      height: 20,
                    ),
                  ]),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => EditDetails()),
          );
        },
        child: Icon(Icons.edit),
        backgroundColor: Colors.grey[850],
      ),
    );
  }
}
