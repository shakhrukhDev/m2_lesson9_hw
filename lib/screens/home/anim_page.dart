import 'package:flutter/material.dart';

class AnimPage extends StatefulWidget {
  const AnimPage({Key? key}) : super(key: key);

  @override
  State<AnimPage> createState() => _AnimPageState();
}

class _AnimPageState extends State<AnimPage> with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation colorAnimation;
  late Animation sizeAnimation;

  @override
  void initState() {
    super.initState();
    controller =  AnimationController(vsync: this, duration: Duration(seconds: 2));
    colorAnimation = ColorTween(begin: Colors.blue, end: Colors.green).animate(controller);
    sizeAnimation = Tween<double>(begin: 100.0, end: 600).animate(controller);
    controller.addListener(() {
      setState(() {});
    });
    controller.repeat();

    //For single time
    //controller.forward()

    //Reverses the animation instead of starting it again and repeats
    //controller.repeat(reverse: true);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animation Demo"),
      ),
      body: Center(
        child: Container(
          height: sizeAnimation.value,
          width: sizeAnimation.value,
          color: colorAnimation.value,

        ),
      ),
    );
  }
}
