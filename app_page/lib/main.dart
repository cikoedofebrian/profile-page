import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Montserrat',
      ),
      home: const AppPage(),
    );
  }
}

class AppPage extends StatelessWidget {
  const AppPage({Key? key}) : super(key: key);

  static List<String> Skill = [
    "Sql",
    "Python",
    "Flutter & Dart",
    "C++",
    "C#",
    "HTML and CSS",
    "JavaScript"
  ];

  static List<Map<String, String>> Goals = [
    {
      'title': 'images/mobile.jpeg',
      'sub': 'Learning how to be a mobile developer with Flutter and Dart.'
    },
    {
      'title': 'images/maastricht.jpg',
      'sub': 'Accepted to Maastricht University through IISMA 2023.'
    },
    {'title': 'images/aslab.jpg', 'sub': 'Becoming a Laboratorium Assistant.'},
  ];

  static List<IconData> apaiya = [
    FontAwesomeIcons.github,
    FontAwesomeIcons.facebook,
    FontAwesomeIcons.instagram,
    FontAwesomeIcons.linkedin
  ];

  Widget rill() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CircleAvatar(
          radius: 73,
          backgroundColor: Colors.white,
          child: CircleAvatar(
            radius: 70,
            backgroundImage: AssetImage('images/rill.jpg'),
          ),
        ),
      ],
    );
  }

  Widget rill2(IconData affaiyah) {
    return Container(
      margin: EdgeInsets.all(4),
      child: CircleAvatar(
        backgroundColor: Colors.red,
        child: Icon(
          affaiyah,
          size: 30,
          color: Colors.white,
        ),
        radius: 30,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.25,
                width: double.infinity,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('images/anime.jpg'),
                        fit: BoxFit.cover)),
              ),
              SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 2 / 3 * 0.25,
                    ),
                    rill(),
                  ],
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 5),
            child: Text(
              'Ciko Edo Febrian',
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 22),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.location_on, color: Colors.grey, size: 20),
              SizedBox(
                width: 4,
              ),
              Text(
                'Jember, Indonesia',
                style: TextStyle(color: Colors.grey, fontSize: 12),
              )
            ],
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: Text(
              'I am a sophomore majoring in Technology Information at The University of Jember. Interested in mobile and game development.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12),
            ),
          ),
          Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'Check me out on :',
                style: TextStyle(fontSize: 12),
              )),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: apaiya.map(
                (icon) {
                  return rill2(icon);
                },
              ).toList()),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              'My skills :',
              style: TextStyle(fontSize: 12),
            ),
          ),
          Container(
            height: 150,
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemBuilder: ((context, index) {
                return Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.symmetric(horizontal: 40, vertical: 4),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                          color: Colors.grey[400] as Color, width: 2),
                      borderRadius: BorderRadius.circular(20)),
                  child: Text(
                    Skill[index],
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 12),
                  ),
                );
              }),
              itemCount: Skill.length,
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 70, vertical: 4),
            child: Text(
              'Scroll to see more',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 12,
                  color: Colors.grey[400]),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              'My goals in the near future :',
              style: TextStyle(fontSize: 12),
            ),
          ),
          SizedBox(
            height: 0,
          ),
          CarouselSlider(
            options: CarouselOptions(
              height: 250,
            ),
            items: Goals.map((rill) {
              return Card(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                elevation: 6,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                      child: Image.asset(
                        rill["title"] as String,
                        height: 150,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        rill["sub"] as String,
                        style: TextStyle(fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
          SizedBox(
            height: 20,
          )
        ],
      ),
    ));
  }
}
