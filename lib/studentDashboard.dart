import 'package:Project/models/StudentModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'models/CompanyModel.dart';
import 'providers/DatabaseProvider.dart';

class StudentDashboard extends StatefulWidget {
  final StudentModel student;
  StudentDashboard({Key key, @required this.student}) : super(key: key);
  @override
  _StudentDashboardState createState() => _StudentDashboardState();
}

class _StudentDashboardState extends State<StudentDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90,
        title: Text(
          "Dashboard",
          style: TextStyle(
            color: Colors.white,
            fontSize: 30.0,
            fontFamily: 'Schyler',
          ),
        ),
        backgroundColor: Colors.green,
      ),
      body: SafeArea(
        child: Container(
          height: double.infinity,
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(
              horizontal: 10.0,
            ),
            child: getAllButtons(),
          ),
        ),
      ),
    );
  }

  Future<List<CompanyModel>> getAllCompanies() async =>
      await DatabaseProvider().fetchCompanies();

  dynamic getAllButtons() {
    return FutureBuilder<List<CompanyModel>>(
      future: getAllCompanies(),
      builder: (context, AsyncSnapshot<List<CompanyModel>> snapshot) {
        if (snapshot.hasData) {
          var theListOfCompanies = snapshot.data;
          List<Widget> listOfWidgets = <Widget>[];
          theListOfCompanies?.forEach((element) {
            var theCupertinoButton = CupertinoButton(
              child: getRowWidget(element),
              onPressed: () async {
                var url = element.link;
                await launch(url);
              },
            );
            listOfWidgets.add(theCupertinoButton);
          });
          return Column(
            children: listOfWidgets,
          );
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }

  Widget getRowWidget(CompanyModel company) {
    return Container(
      height: 250,
      width: MediaQuery.of(context).size.width * 0.87,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/background.jpg"),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Container(
        margin: EdgeInsets.fromLTRB(15, 15, 0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              company.name,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontFamily: 'Schyler',
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "Arrival: " + company.arrival,
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Schyler',
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "CTC: " + company.ctc.toString(),
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Schyler',
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Eligible: " + isEligible(company),
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Schyler',
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }

  String isEligible(CompanyModel company) {
    return (widget.student.tenth >= company.tenth &&
            widget.student.twelfth >= company.twelfth &&
            widget.student.cgpa >= company.graduation)
        ? 'Yes'
        : 'No';
  }
}
