import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BtnUI extends StatefulWidget {
  const BtnUI(
      {this.fieldKey,
      this.color,
      this.textColor,
      this.text,
      this.ontap,
      this.height = 50,
      this.fontSize = 18,
      this.padding,
      this.isLoading = false,
      this.child});

  final Key? fieldKey;
  final String? text;
  final Color? color;
  final Color? textColor;
  final double height;
  final double fontSize;
  final EdgeInsets? padding;
  final child;
  final bool isLoading;
  final GestureTapCallback? ontap;

  @override
  _BtnUIState createState() => _BtnUIState();
}

class _BtnUIState extends State<BtnUI> with SingleTickerProviderStateMixin {
  late double _scale;
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 500,
      ),
      lowerBound: 0.0,
      upperBound: 0.1,
    )..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _scale = 1 - _controller.value;
    return Padding(
      padding: widget.padding ?? EdgeInsets.all(0.0),
      child: GestureDetector(
        onTap: widget.ontap,
        onTapDown: _tapDown,
        onTapUp: _tapUp,
        child: Transform.scale(
          scale: _scale,
          child: Container(
            height: widget.height,
            decoration: BoxDecoration(
                color: widget.color,
                borderRadius: BorderRadius.circular(13.0),
                boxShadow: [
                  BoxShadow(
                      color: Color(0xAA325ED).withAlpha(20),
                      offset: Offset(0, 24),
                      blurRadius: 48,
                      spreadRadius: -18)
                ]),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      widget.text!,
                      style: TextStyle(
                        fontSize: widget.fontSize,
                        color: widget.textColor ?? Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Visibility(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 13.0),
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.white,
                      ),
                    ),
                    maintainState: true,
                    maintainAnimation: true,
                    maintainSize: true,
                    visible: widget.isLoading,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _tapDown(TapDownDetails details) {
    _controller.forward();
  }

  void _tapUp(TapUpDetails details) {
    _controller.reverse();
  }
}
