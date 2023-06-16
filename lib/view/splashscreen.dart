import 'package:finalexamflutter/view/color.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class splashscreen extends StatefulWidget {
  const splashscreen({super.key});

  @override
  State<splashscreen> createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen>
    with TickerProviderStateMixin {
  late AnimationController _ss;
  bool ssAnimated = false;
  bool animateText = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _ss = AnimationController(vsync: this);
    _ss.addListener(() {
      if (_ss.value > 0.7) {
        _ss.stop();
        ssAnimated = true;
        setState(() {});
        Future.delayed(const Duration(seconds: 3), () {
          animateText = true;
          setState(() {});
        });
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _ss.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: backgroundss,
      body: Stack(children: [
        AnimatedContainer(
          duration: const Duration(seconds: 3),
          height: ssAnimated ? screenHeight / 1.7 : screenHeight,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(ssAnimated ? 40.0 : 0.0)),
          ),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Visibility(
                  visible: !ssAnimated,
                  child: Lottie.asset(
                    'assets/image/lg.json',
                    height: 190.0,
                    width: 190.0,
                    controller: _ss,
                    onLoaded: (composition) {
                      _ss
                        ..duration = composition.duration
                        ..forward();
                    },
                  ),
                ),
                Visibility(
                  visible: ssAnimated,
                  child: Image.asset(
                    'assets/image/logo.png',
                    height: 190.0,
                    width: 190.0,
                  ),
                ),
                Center(
                  child: AnimatedOpacity(
                    opacity: animateText ? 1 : 0,
                    duration: const Duration(seconds: 2),
                    child: const Text(
                      'O F F I C E',
                      style: TextStyle(fontSize: 50.0, color: backgroundss),
                    ),
                  ),
                ),
              ]),
        ),
        Visibility(visible: ssAnimated, child: const _BottomPart()),
      ]),
    );
  }
}

class _BottomPart extends StatelessWidget {
  const _BottomPart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const SizedBox(
              height: 50.0,
            ),
            const Text(
              'Hello !',
              style: TextStyle(
                  fontSize: 27.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            const SizedBox(height: 30.0),
            Text(
              'Lets Get Started',
              style: TextStyle(
                fontSize: 15.0,
                color: Colors.white.withOpacity(0.8),
                height: 1.5,
              ),
            ),
            const SizedBox(height: 50.0),
            SizedBox(
              width: 400,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                  backgroundColor: Colors.white,
                ),
                onPressed: () {},
                child: Text(
                  'NEXT'.toUpperCase(),
                  style: TextStyle(color: backgroundss),
                ),
              ),
            ),
            // Align(
            //   child: Container(
            //     height: 85.0,
            //     width: 85.0,
            //     decoration: BoxDecoration(
            //       shape: BoxShape.rectangle,
            //       border: Border.all(color: Colors.white, width: 2.0),
            //     ),
            //     child: const Icon(
            //       Icons.chevron_right,
            //       size: 50.0,
            //       color: Colors.white,
            //     ),
            //   ),
            // ),
            const SizedBox(height: 50.0),
          ],
        ),
      ),
    );
  }
}
