import 'package:flutter/material.dart';

class SlideTransitionWidget extends StatefulWidget {
  final Widget child;

  SlideTransitionWidget({required this.child});

  @override
  _SlideTransitionWidgetState createState() => _SlideTransitionWidgetState();
}

class _SlideTransitionWidgetState extends State<SlideTransitionWidget>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
  }

  @override
  void dispose() {
    //_animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //Future.delayed(Duration(milliseconds: 1500), () => _animationController?.reverse());
    print("dddd");
    return FadeTransition(
      opacity: Tween<double>(begin: -1.0, end: 1.0).animate(
          CurvedAnimation(
            curve: Curves.easeIn,
            parent: _animationController!,
          )),
      child: SlideTransition(
        position: Tween<Offset>(begin: Offset(0, -0.2), end: Offset(0, 0))
            .animate(CurvedAnimation(
          curve: Curves.easeIn,
          parent: _animationController!,
        )),
        child: widget.child,
      ),
    );
  }
}