import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio/ui/biodatascreen.dart';
import 'package:portfolio/ui/landingpage.dart';
import 'package:portfolio/ui/personalinfo.dart';

import '../utils/strings.dart';
import 'footerui.dart';

class NewScreen extends StatefulWidget {

  NewScreen({super.key});

  @override
  State<NewScreen> createState() => _NewScreenState();
}

class _NewScreenState extends State<NewScreen> {
  final _controller = ScrollController();
  bool _showBackToTopButton = false;

  // scroll controller
  late ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {
          if (_scrollController.offset >= 400) {
            _showBackToTopButton = true; // show the back-to-top button
          } else {
            _showBackToTopButton = false; // hide the back-to-top button
          }
        });
      });

    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose(); // dispose the controller
    super.dispose();
  }

  // This function is triggered when the user presses the back-to-top button
  void _scrollToTop() {
    _scrollController.animateTo(0,
        duration: const Duration(milliseconds: 500), curve: Curves.linear);
  }

  @override
  Widget build(BuildContext context) {
    void _onpressed(height){
      final screenheight = _scrollController.position.maxScrollExtent;;
      _scrollController.jumpTo(screenheight);
      _scrollController.animateTo(screenheight, duration: Duration(seconds: 2), curve: Curves.easeOut);
    }


    return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading:Center(child: Row(
          children: [
            Icon(Icons.account_circle),
            Text(" Madhu Co.",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),),
          ],
        )),
        leadingWidth: 300,
        backgroundColor: Colors.white,
        actions: [
          TextButton(onPressed: _scrollToTop, child: Text("HOME",style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w400),)),
          TextButton(onPressed: (){
              _onpressed(250);
          }, child: Text("ABOUT",style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w400),)),
          TextButton(onPressed: (){
            showDialog(
                context: context,
                builder: (ctxt) => AlertDialog(
                  shadowColor: Colors.black54,
                  surfaceTintColor: Colors.teal,
                  titleTextStyle: TextStyle(fontWeight: FontWeight.w500,fontSize: 36),
                  actions: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Email: $mail'),
                        Text('Mobile: $number'),
                      ],)
                  ],
                  title: Text("Contact Us"),
                )
            );
          }, child: Text("CONTACT",style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w400),)),
          IconButton(// Within the `FirstRoute` widget
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BioDataScreen()),
                );
              }, icon: Icon(Icons.account_circle,size: 36,color: Colors.teal,)).animate(onPlay: (controller) => controller.repeat(reverse: true)).shake(rotation: 0.5,delay: Duration(seconds: 1),duration: Duration(seconds: 1),),
          SizedBox(width: 20,)
        ],
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            LandingPage(),
            SizedBox(height: 20,),
            PersonalInfoUi(),
            // Bottombar(),
          ],
        ),
      ),

    );
  }
}
