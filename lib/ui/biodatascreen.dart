import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio/utils/values.dart';

class BioDataScreen extends StatelessWidget {
  const BioDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
            // Container(
            //   width: double.maxFinite,
            //   decoration: BoxDecoration(
            //
            //     gradient: LinearGradient(
            //         colors: [
            //           Colors.black,
            //           Colors.black87,
            //           Colors.black,
            //         ],
            //         ),
            //   ),
            //
            // ),

            Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage('bg3.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.1),
              BlendMode.darken,
            ),
          )),
        ),
        Positioned(
            child: Center(
                child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              HoverFlipContainer(),
              Container(
                width: width / 2,
                height: height,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        width: width / 2,
                        color: Colors.transparent,
                        height: height / 2,
                        child: Column(
                          children: [
                            Text(
                              "CAREER OBJECTIVE",
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineLarge!
                                  .copyWith(fontSize: 35),
                            ),
                            Text(
                              """Throughout my career as a software developer, I've focused 
on developing scalable and well-documented code. I enjoy 
working collaboratively but can also run with projects on my 
own.""",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(fontSize: 24),
                            ).animate().slideY(duration: Duration(milliseconds: 800),begin: -5,end:0.2),
                          ],
                        ),
                      ),
                      // Container(width: width/2,color: Colors.red,height: height/2,),
                      // Container(width: width/2,color: Colors.yellow,height: height/2.5,),
                      // Container(width: width/2,color: Colors.grey,height: height/3,),
                      // Container(width: width/2,color: Colors.blue,height: height/3,),
                    ],
                  ),
                ),
              ),
            ],
          ),
        )))
      ],
    ));
  }
}

class HoverFlipContainer extends StatefulWidget {
  @override
  _HoverFlipContainerState createState() => _HoverFlipContainerState();
}

class _HoverFlipContainerState extends State<HoverFlipContainer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _isHovered = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onEnter(PointerEvent details) {
    setState(() {
      _isHovered = true;
      _controller.forward();
    });
  }

  void _onExit(PointerEvent details) {
    setState(() {
      _isHovered = false;
      _controller.reverse();
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height =
        MediaQuery.of(context).size.height; // Define your desired height

    return MouseRegion(
      onEnter: _onEnter,
      onExit: _onExit,
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..rotateY(_animation.value * 3.14), // Flip horizontally
            child: Container(
              width: width / 2,
              height: height,
              child: Image.asset(
                "logo.png",
                fit: BoxFit.cover,
              ).animate().flipH(),
            ),
          );
        },
      ),
    );
  }
}
