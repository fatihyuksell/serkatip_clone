
import 'package:etv/constants.dart';
import 'package:flutter/material.dart';

class ProfileActionItem extends StatelessWidget {
  final String title;
  final String icon;
  final VoidCallback onTap;
  final IconData iconAlt;

  const ProfileActionItem({
    Key key,
    this.title = 'Item',
    this.onTap,
    this.iconAlt,
    this.icon = 'assets/icons/home.png',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(4),
        highlightColor: Colors.transparent,
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            children: [
              if (iconAlt != null) Icon(iconAlt, size: 16, color: PRIMARY_GRAY),
              if (icon != null && iconAlt == null) Image.asset(icon, width: 20, height: 20),
              SizedBox(width: 8),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: Text(
                    '$title',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: PRIMARY_GRAY),
                  ),
                ),
              ),
              Icon(Icons.arrow_forward),
            ],
          ),
        ),
      ),
    );
  }
}