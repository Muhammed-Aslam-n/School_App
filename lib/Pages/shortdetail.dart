import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'dart:async';
import '/model/school.dart';
import 'package:schoolapp/utils/database_helper.dart';
import 'package:sqflite/sqflite.dart';
import '../model/school.dart';
import '../utils/database_helper.dart';
import '../Pages/home.dart';
import '../Pages/editdetails.dart';
import '../Pages/fullldetail.dart';
import '../Pages/shortdetail.dart';

class ShortDetail extends StatefulWidget {


  @override
  _ShortDetailState createState() => _ShortDetailState();
}

class _ShortDetailState extends State<ShortDetail> {

  late final School sc;
  late List<School> school;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    refreshSchool();
  }

  @override
  void dispose() {
    SchoolDatabase.instance.close();

    super.dispose();
  }


  Future refreshSchool() async {
    setState(() => isLoading = true);

    this.school = await SchoolDatabase.instance.readAllSchool();

    setState(() => isLoading = false);
  }

  // studentItems({image, studentName}) {
  //   return Column(
  //     // mainAxisAlignment: MainAxisAlignment.center,
  //     crossAxisAlignment: CrossAxisAlignment.center,
  //     children: [
  //       Container(
  //         width: 150.0,
  //         height: 150.0,
  //         child: CircleAvatar(
  //           backgroundImage: AssetImage('$image'),
  //         ),
  //       ),
  //       SizedBox(
  //         height: 20,
  //       ),
  //       Text(
  //         '$studentName',
  //         style: TextStyle(
  //             fontWeight: FontWeight.w800,
  //             fontSize: 24,
  //             color: Colors.teal,
  //             fontFamily: 'DancingScript',
  //             letterSpacing: 2,
  //             wordSpacing: 2),
  //       ),
  //       TextButton(
  //         onPressed: () {
  //           print("View Details Clicked");
  //           Navigator.pushNamed(context, '/fullDetails');
  //         },
  //         child: Text(
  //           'View Details',
  //           style: TextStyle(fontSize: 18, color: Colors.teal),
  //         ),
  //       ),
  //     ],
  //   );
  // }

  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(253, 250, 250, 1),
      appBar: AppBar(
        leading: Image.asset('images/AppbarICon2.png'),
        backgroundColor: Colors.blueAccent,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              'DreamSchool',
              style: TextStyle(
                  fontFamily: 'DancingScript',
                  fontWeight: FontWeight.w600,
                  fontSize: 26),
            ),
            Text(
              'Where Wishes Comes True',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 8,
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: isLoading
            ? CircularProgressIndicator()
            : school.isEmpty
            ? Text(
          'No Students Added',
          style: TextStyle(color: Colors.white, fontSize: 24),
        )
            : buildSchool(),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        child: Icon(Icons.add),
        onPressed: () async {
          await Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => EditDetails()),
          );
          refreshSchool();
        },
      ),
    );
  }

  Widget buildSchool() =>
      ListView.builder(
        itemCount: school.length,
        itemBuilder: (context, index) {
          final school1 = school[index];
          return GestureDetector(
            onTap: () async {
              await Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => Fulldetail(schoolid: school1.id!),
              ));

              refreshSchool();
            },
              child: ListView(
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 150.0,
                        height: 150.0,
                        child: CircleAvatar(
                          child: Text(''),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        sc.name,
                        style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 24,
                            color: Colors.teal,
                            fontFamily: 'DancingScript',
                            letterSpacing: 2,
                            wordSpacing: 2),
                      ),
                      TextButton(
                        onPressed: () {
                          print("View Details Clicked");
                          Navigator.pushNamed(context, '/fullDetails');
                        },
                        child: Text(
                          'View Details',
                          style: TextStyle(fontSize: 18, color: Colors.teal),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                ],
              ),
            );
        },
      );
}


