import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';


class Home extends StatefulWidget {

  late List<School> notes;

  @override
  _HomeState createState() => _HomeState();
}

contentBox({heading, desc, color}) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      color: color,
    ),
    margin: EdgeInsets.all(20),
    child: Column(
      children: [
        SizedBox(
          height: 20,
        ),
        Text(
          heading,
        ),
        Container(
          margin: EdgeInsets.fromLTRB(15, 25, 10, 15),
          child: Text(
            desc,
            style: TextStyle(letterSpacing: 2, wordSpacing: 1.2),
          ),
        )
      ],
    ),
  );
}


class _HomeState extends State<Home> {
  final List<String> imageList = [
    "images/schoolpics/School1.jfif",
    "images/schoolpics/School2.jfif",
    "images/schoolpics/School3.jfif",
    "images/schoolpics/School4.jfif",
    "images/schoolpics/School5.jfif",
  ];

  @override
  Widget build(BuildContext context) {

    buttonBox({buttonText,routName}){
      return Expanded(
        child: ElevatedButton(
          onPressed: () async{
            await Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => EditDetails()),
            );
          },
          style: ElevatedButton.styleFrom(
              fixedSize: Size(175, 50)),
          child: Text(
            buttonText,
            style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Colors.white),
          ),
        ),
      );
    }

    return Scaffold(
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
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.all(25.0),
              child: CarouselSlider(
                options: CarouselOptions(
                  enlargeCenterPage: true,
                  enableInfiniteScroll: false,
                  autoPlay: true,
                ),
                items: imageList
                    .map((e) => ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Stack(
                            fit: StackFit.expand,
                            children: <Widget>[
                              Image.asset(
                                e,
                                width: 1000,
                                height: 200,
                                fit: BoxFit.cover,
                              )
                            ],
                          ),
                        ))
                    .toList(),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            contentBox(
              color: Color.fromRGBO(43, 169, 208, 1),
              heading: 'How we Differ',
              desc: descriptionText,
            ),
            contentBox(
              color: Color.fromRGBO(43, 169, 208, 1),
              heading: 'Vision',
              desc: descriptionText,
            ),
            contentBox(
              color: Color.fromRGBO(43, 169, 208, 1),
              heading: 'Stories',
              desc: descriptionText,
            ),
            Container(
              margin: EdgeInsets.fromLTRB(20, 0, 20, 35),
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Color.fromRGBO(43, 169, 208, 1)),
              child: Column(
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    children: [
                      // buttonBox(buttonText: 'View Students',routName: '/shortDetails'),
                      // SizedBox(
                      //   width: 10,
                      // ),
                      // buttonBox(buttonText: 'Search Student',routName: '/shortDetails'),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      buttonBox(buttonText: 'Add Student',routName: '/editDetails'),
                      SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  var descriptionText =
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged";
}
