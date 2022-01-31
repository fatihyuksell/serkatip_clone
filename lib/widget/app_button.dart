import 'package:etv/constants.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final double height;
  final double width;
  final String title;
  final VoidCallback onTap;
  final bool showIndicator;

  const AppButton({
    Key key,
    this.height = 45,
    this.width = 150,
    this.title,
    this.onTap,
    this.showIndicator = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: PRIMARY_YELLOW,
      borderRadius: BorderRadius.circular(4),
      child: InkWell(
        borderRadius: BorderRadius.circular(4),
        onTap: showIndicator ? null : onTap,
        child: Container(
          height: height,
          width: width,
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (showIndicator) SizedBox(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(PRIMARY_GRAY)), height: 20, width: 20),
                if (showIndicator) SizedBox(width: 12),
                Text(
                  '$title',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w900, color: PRIMARY_GRAY),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}