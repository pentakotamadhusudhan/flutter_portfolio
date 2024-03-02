import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:url_launcher/url_launcher.dart';


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
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading:Center(child: Text(" Madhu Co.",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),)),
        leadingWidth: 200,
        backgroundColor: Colors.white,
        actions: [
          TextButton(onPressed: (){}, child: Text("HOME",style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w400),)),
          TextButton(onPressed: (){}, child: Text("ABOUT",style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w400),)),
          TextButton(onPressed: (){}, child: Text("CONTACT",style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w400),)),
          TextButton(onPressed: (){}, child: Text("GITHUB",style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w400),)),
        ],
      ),
      body: Container(
        height: 800,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("bg3.jpg"),
            fit: BoxFit.fill,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 380,
              width: 450,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:  [
                      Text("I'm Pentakota Madhu", style: TextStyle(fontSize:42,color:Colors.black,fontWeight: FontWeight.bold)),
                      Text('Software Developer',style: TextStyle(fontSize:18,color:Colors.black ,fontWeight: FontWeight.normal)),
                    ],
                ),
              )

              // color: isHover?Colors.teal:Colors.blue,
            ),
            InkWell(
              onTap: (){
              },
              onHover: (value){
                setState(() {
                  isHover = value;

                });
              },
            child: isHover?Container(
              height: 450,
              width: 450,
              decoration:BoxDecoration(
                color: Colors.black,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.black,width: 2),
                  boxShadow: [
                    BoxShadow(blurRadius: 5,spreadRadius: 5,color: Colors.grey)
                  ],
                  image:  DecorationImage(image: AssetImage('logo.png'),scale: 1,fit: BoxFit.fill,opacity: 0.45)
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                    IconButton(onPressed: _launchURLApp, icon: Icon(Icons.g_mobiledata,color: Colors.white,size: 36,),),
                    IconButton(onPressed:() async {
                    var url = Uri.parse("https://github.com/pentakotamadhusudhan");
                    if (await canLaunchUrl(url)) {
                    await launchUrl(url);
                    } else {
                    throw 'Could not launch $url';
                    }
                    }, icon: Icon(Icons.install_desktop,color: Colors.white,size: 36,),),
                    IconButton(onPressed: () async {
                      var url = Uri.parse("https://www.facebook.com/profile.php?id=100084044290872");
                      if (await canLaunchUrl(url)) {
                        await launchUrl(url);
                      } else {
                        throw 'Could not launch $url';
                      }
                    }, icon: Icon(Icons.facebook,color: Colors.white,size: 36,),),
                    IconButton(onPressed: () async {
                      var url = Uri.parse("'https://www.linkedin.com/in/m-a-d-h-u/'");
                      if (await canLaunchUrl(url)) {
                        await launchUrl(url);
                      } else {
                        throw 'Could not launch $url';
                      }
                    }, icon: Icon(Icons.face,color: Colors.white,size: 36,)),

                  ],),
                  Container(
                    height: 80,
                    width: 400,
                    color: Colors.white,
                    child: Center(child: Text("  Madhu Sudhan\nSoftware developer",style: TextStyle(fontWeight: FontWeight.w300),),),
                  )
                ],
              ).animate().moveY(begin: 350,end: 280 )
            ):Container(
              height: 450,
              width: 450,
              decoration:BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.black,width: 2),
                  // shape: BoxShape.circle,
                  image: const DecorationImage(image: AssetImage('logo.png'),scale: 1,fit: BoxFit.fill,)
              ),
            )
          ),

        ],),
      ),
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
