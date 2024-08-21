import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:portfolio/utils/values.dart';

class PersonalInfoUi extends StatelessWidget {
  PersonalInfoUi({super.key});



  @override
  Widget build(BuildContext context) {

    return Column(
      children: <Widget>[
        Row(
          children: [
            Container(
              height: 300,
              width: width / 3,
              padding: EdgeInsets.all(10),
              color: Colors.black38,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Who am I ?",
                    style: TextStyle(fontSize: 48, fontWeight: FontWeight.w300),
                  ),
                  Text(
                    "A Web Developer/Android Developer \nLocated In Our Lovely Earth",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.normal),
                  )
                ],
              ),
            ),
            Container(
              height: width < 800 ? 400 : 300,
              width: width / 3,
              padding: EdgeInsets.all(10),
              color: Colors.black26,
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Personal Info",
                    style: TextStyle(fontSize: 48, fontWeight: FontWeight.w300),
                  ),
                  Text(
                    "Birthdate: 08-06-1997",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
                  ),
                  Text(
                    "Email: pentakotamadhu74@gmail.com",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
                  ),
                  Text(
                    "Phone: +(91) 9398582419",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
                  ),
                  Text(
                    "Address:",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
                  ),
                  Text(
                    "Anakapalli,Visakhapatnam,\n531002",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
                  ),
                ],
              ),
            ),
            Container(
              height: 300,
              width: width / 3,
              padding: EdgeInsets.all(10),
              color: Colors.white54,
              child: Column(
                children: [
                  const Text(
                    "My Expertise",
                    style: TextStyle(fontSize: 48, fontWeight: FontWeight.w300),
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 150,
                      child: ListView(
                        shrinkWrap:true,

                        children: [
                          ListTile(
                            title: const Text(
                              "Python developer",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.normal),
                            ),
                            subtitle: Text("Django developer"),
                            leading: Brand(Brands.python),
                          ),
                          ListTile(
                            title: const Text(
                              "Android developer",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.normal),
                            ),
                            subtitle: Text("Flutter developer"),
                            leading: Brand(Brands.flutter),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
       
      ],
    );
  }
}
