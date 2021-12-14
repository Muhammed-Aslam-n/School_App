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

class Fulldetail extends StatefulWidget {
  final int schoolid;
  const Fulldetail({
    Key? key,
    required this.schoolid,
}) : super(key : key);

  @override
  _FulldetailState createState() => _FulldetailState();
}

class _FulldetailState extends State<Fulldetail> {
  late School school;
  bool isLoading = false;

  @override
  void initState(){
    super.initState();

    refreshNote();
  }

  Future refreshNote() async{
    setState(() => isLoading = true);
    this.school = await SchoolDatabase.instance.readSchool(widget.schoolid);
    setState(() => isLoading = false);
  }


  //
  // listTile({var text, var icon}) {
  //   return ListTile(
  //     leading: editButton(icon),
  //     title: detailText(text: text),
  //     trailing: iconn(),
  //   );
  // }

  // sDetails({var text, IconData? icon}) {
  //   return Card(
  //     color: Colors.white,
  //     margin: EdgeInsets.all(16),
  //     child: ListTile(
  //     leading: TextButton(
  //       onPressed: () {
  //         print("Edit Clicked");
  //       },
  //       child: Icon(Icons.person),
  //     ),
  //   title: detailText(text: text),
  //   trailing: iconn()
  //   ),
  //   );
  // }

  // editButton(IconData icon) {
  //   return TextButton(
  //     onPressed: () {
  //       print("Edit Clicked");
  //       // setState(() {
  //       //   EditArea();
  //       // });
  //     },
  //     child: Icon(icon),
  //   );
  // }

  iconn() {
    return Icon(
      Icons.delete,
      color: Colors.red,
    );
  }

  detailText() {
    return Text(
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged",
      style: TextStyle(
          fontSize: 15, fontWeight: FontWeight.w700, color: Colors.blueAccent),
    );
  }

  updateButton() {
    return Container(
      alignment: Alignment.topRight,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(primary: Colors.blueAccent,splashFactory: InkSplash.splashFactory),
        onPressed: () async{
          if(isLoading) return;

          await Navigator.of(context).push(MaterialPageRoute(builder: (context) => EditDetails(school: school),
          ));
          refreshNote();
        },
        child: Text(
          'Edit',
          style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: isLoading ? Center(child: CircularProgressIndicator(),)
            :SafeArea(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(top: 50),
                width: 150.0,
                height: 150.0,
                child: CircleAvatar(
                  backgroundImage: AssetImage('images/students/s1.jfif'),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "${school.name}",
                style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 24,
                    color: Colors.white,
                    fontFamily: 'DancingScript',
                    letterSpacing: 2,
                    wordSpacing: 2),
              ),
              Card(
                color: Colors.white,
                margin: EdgeInsets.all(16),
                child: ListTile(
                    leading: TextButton(
                      onPressed: () {
                        print("Edit Clicked");
                      },
                      child: Icon(Icons.person),
                    ),
                    title: Text("\n ${school.age}\n ${school.rollnum}\n ${school.mobile}"),
                    trailing: iconn()
                ),
              ),
              SizedBox(
                height: 20,
              ),
              updateButton(),
            ],
          ),
        ),
      ),
    );
  }
}
