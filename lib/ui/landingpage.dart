import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:portfolio/repositry/firebaseserivce.dart';
import 'package:portfolio/utils/image.dart';
import 'package:portfolio/utils/strings.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

import '../utils/values.dart';

String releasePath = kDebugMode ? 'https://c1.wallpaperflare.com/preview/427/745/192/notebook-natural-laptop-macbook.jpg' : 'assest/logo.png';
class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  bool isHover =false;
  bool madhu = false;




  @override
  Widget build(BuildContext context) {
    print(width);
    print(height);
    return  Container(
        height: 550,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(bgimage),
            fit: BoxFit.fill,
          ),
        ),

child:
          Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height:500,
              width: thiridwidth,
              child:  Column(
                mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  [
                    Text("Hello, I am ", style: TextStyle(fontSize:42,color:Colors.black ,fontWeight: FontWeight.w400)),
                    Text("Madhu sudhan ",maxLines: 2, style: TextStyle(fontSize:60,color:Colors.black ,fontWeight: FontWeight.bold)),
                    // Text('Software Developer  |  Android Developer',style: TextStyle(fontSize:18,color:Colors.black ,fontWeight: FontWeight.w500)),
                    SizedBox(
                      height: 24,
                      child: DefaultTextStyle(
                        style: const TextStyle(
                          fontSize: 14.0,
                          fontFamily: 'Vertical',
                          fontWeight: FontWeight.bold
                        ),
                        child: AnimatedTextKit(
                          repeatForever: true,
                          animatedTexts: [
                            RotateAnimatedText('WEB DEVELOPER | FULL STACK'),
                            RotateAnimatedText('PYTHON DEVELOPER | DJANGO'),
                            RotateAnimatedText('ANDROID DEVELOPER | FLUTTER'),
                          ],
                          onTap: () {
                            print("Tap Event");
                          },
                        ),
                      ),
                    ),



                    Text(content,
                        style: TextStyle(fontSize:width<800?12:18,color:Colors.black ,fontWeight: FontWeight.normal)),
                  ],
              )

              // color: isHover?Colors.teal:Colors.blue,
            ),
            InkWell(
              onTap: (){
                print("object");
                downloadImage("assets/logo.png");
              },
              onHover: (value){
                setState(() {
                  isHover = value;

                });
              },
            child: isHover?Container(
              height: width<800?300:450,
              width: width<800?300:450,
              decoration:BoxDecoration(
                color: Colors.black,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.black,width: 2),
                  boxShadow: [
                    BoxShadow(blurRadius: 5,spreadRadius: 5,color: Colors.teal  )
                  ],
                  image:  DecorationImage(image: AssetImage('assets/logo.png'),scale: 1,fit: BoxFit.fill,opacity: 0.3)
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                    // IconButton(onPressed: _launchURLApp, icon: Icon(AntDesign.github_fill,color: Colors.white,size: 36,),),
                    IconButton(onPressed:() async {
                    var url = Uri.parse("https://github.com/pentakotamadhusudhan");
                    if (await canLaunchUrl(url)) {
                    await launchUrl(url);
                    } else {
                    throw 'Could not launch $url';
                    }
                    }, icon: Icon(AntDesign.github_fill,color: Colors.white,size: 36,),),

                    IconButton(onPressed: () async {
                      var url = Uri.parse("https://www.facebook.com/profile.php?id=100084044290872");
                      if (await canLaunchUrl(url)) {
                        await launchUrl(url);
                      } else {
                        throw 'Could not launch $url';
                      }
                    }, icon: Icon(AntDesign.facebook_fill,color: Colors.white,size: 36,),),

                    IconButton(onPressed: () async {
                      var url = Uri.parse("https://www.linkedin.com/in/m-a-d-h-u/");
                      if (await canLaunchUrl(url)) {
                        await launchUrl(url);
                      } else {
                        throw 'Could not launch $url';
                      }
                    }, icon: Icon(AntDesign.linkedin_fill,color: Colors.white,size: 36,)),

                  ],),
                  Container(
                    height: 60,
                    width: 400,
                    color: Colors.white,
                    child: Center(child: Text("  Madhu Sudhan\nSoftware developer",style: TextStyle(fontWeight: FontWeight.bold),),),
                  )
                ],
              ).animate().moveY(begin: 330,end: 260,duration: Duration(milliseconds: 100) )
            ):Container(
              height: width<800?300:450,
              width: width<800?300:450,
              decoration:BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.black,width: 2),
                  // shape: BoxShape.circle,
                  image: const DecorationImage(image: AssetImage('assets/logo.png'),scale: 1,fit: BoxFit.fill,opacity: 0.2)
              ),
            )
          ),

        ],)
        // ],

    );
  }
}

_launchURLApp() async {
  var url = Uri.parse("https://www.geeksforgeeks.org/");
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Could not launch $url';
  }
}
