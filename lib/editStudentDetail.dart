import 'package:Project/models/StudentModel.dart';
import 'package:Project/providers/DatabaseProvider.dart';
import 'package:dropdownfield/dropdownfield.dart';
import 'package:flutter/material.dart';

class EditDetails extends StatefulWidget {
  final StudentModel student;
  EditDetails({Key key, this.student}) : super(key: key);
  @override
  _EditDetailsState createState() => _EditDetailsState();
}

class _EditDetailsState extends State<EditDetails> {
  dynamic tname, troll, tcourse, ttenth, ttwelfth, tcgpa;
  Widget _buildNameTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
            alignment: Alignment.centerLeft,
            height: 60.0,
            child: Material(
              elevation: 10.0,
              shadowColor: Colors.grey,
              child: TextField(
                controller:
                    TextEditingController(text: widget.student.name.toString()),
                onChanged: (value) => tname = value,
                keyboardType: TextInputType.name,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Name',
                    contentPadding: EdgeInsets.only(top: 14.0),
                    prefixIcon: Icon(
                      Icons.person,
                    )),
              ),
            ))
      ],
    );
  }

  Widget _buildRollNoTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
            alignment: Alignment.centerLeft,
            height: 60.0,
            child: Material(
              elevation: 10.0,
              shadowColor: Colors.grey,
              child: TextField(
                controller: TextEditingController(
                    text: widget.student.rollNumber.toString()),
                onChanged: (value) => troll = value,
                keyboardType: TextInputType.number,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Roll Number',
                    contentPadding: EdgeInsets.only(top: 14.0),
                    prefixIcon: Icon(
                      Icons.note,
                    )),
              ),
            ))
      ],
    );
  }

  Widget _buildCourseDropDown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          alignment: Alignment.centerLeft,
          height: 200.0,
          child: Material(
            elevation: 10.0,
            shadowColor: Colors.grey,
            child: DropDownField(
              controller: courseSelected,
              hintText: "Select Course",
              enabled: true,
              items: courses,
              onValueChanged: (value) {
                setState(() {
                  selectCity = value;
                  tcourse = value;
                });
              },
            ),
          ),
        )
      ],
    );
  }

  Widget _buildClass10Marks() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
            alignment: Alignment.centerLeft,
            child: Material(
              elevation: 10.0,
              shadowColor: Colors.grey,
              child: TextField(
                controller: TextEditingController(
                    text: widget.student.tenth.toString()),
                onChanged: (value) => ttenth = value,
                keyboardType: TextInputType.number,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Class 10 Percentage/CGPA',
                    contentPadding: EdgeInsets.only(top: 14.0),
                    prefixIcon: Icon(
                      Icons.description,
                    )),
              ),
            ))
      ],
    );
  }

  Widget _buildClass12Marks() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
            alignment: Alignment.centerLeft,
            height: 60.0,
            child: Material(
              elevation: 10.0,
              shadowColor: Colors.grey,
              child: TextField(
                controller: TextEditingController(
                    text: widget.student.twelfth.toString()),
                onChanged: (value) => ttwelfth = value,
                keyboardType: TextInputType.number,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Class 12 Percentage/CGPA',
                    contentPadding: EdgeInsets.only(top: 14.0),
                    prefixIcon: Icon(
                      Icons.description,
                    )),
              ),
            ))
      ],
    );
  }

  Widget _buildCollegeMarks() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
            alignment: Alignment.centerLeft,
            height: 60.0,
            child: Material(
              elevation: 10.0,
              shadowColor: Colors.grey,
              child: TextField(
                controller:
                    TextEditingController(text: widget.student.cgpa.toString()),
                onChanged: (value) => tcgpa = value,
                keyboardType: TextInputType.number,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Overall College CGPA',
                    contentPadding: EdgeInsets.only(top: 14.0),
                    prefixIcon: Icon(
                      Icons.description,
                    )),
              ),
            ))
      ],
    );
  }

  Widget _submitBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25),
      width: double.infinity,
      child: RaisedButton(
        onPressed: () async {
          await DatabaseProvider().updateStudent(StudentModel(
              cgpa: tcgpa,
              course: tcourse,
              email: widget.student.email,
              name: tname,
              password: widget.student.password,
              rollNumber: troll,
              tenth: ttenth,
              twelfth: ttwelfth));
        },
        elevation: 10,
        padding: EdgeInsets.all(15),
        color: Colors.green,
        child: Text(
          "Submit",
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Schyler',
            fontSize: 20,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90,
        title: Text(
          "Edit Profile",
          style: TextStyle(
            color: Colors.white,
            fontSize: 30.0,
            fontFamily: 'Schyler',
          ),
        ),
        backgroundColor: Colors.green,
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
              physics: AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(
                horizontal: 40.0,
                vertical: 10.0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Welcome Back',
                    style: TextStyle(
                      color: Colors.green[900],
                      fontSize: 30.0,
                      fontFamily: 'Schyler',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    'What would you like to change?',
                    style: TextStyle(
                      color: Colors.green[900],
                      fontSize: 20.0,
                      fontFamily: 'Schyler',
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  _buildNameTF(),
                  SizedBox(
                    height: 30,
                  ),
                  _buildRollNoTF(),
                  SizedBox(
                    height: 30,
                  ),
                  _buildClass10Marks(),
                  SizedBox(
                    height: 30,
                  ),
                  _buildClass12Marks(),
                  SizedBox(
                    height: 30,
                  ),
                  _buildCollegeMarks(),
                  SizedBox(
                    height: 30,
                  ),
                  _buildCourseDropDown(),
                  SizedBox(
                    height: 30,
                  ),
                  _submitBtn(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  String selectCity = "";
  final courseSelected = TextEditingController();
  List<String> courses = ["B.Tech: CSE", "B.Tech: CS-SD", "MCA", "BCA"];
}
