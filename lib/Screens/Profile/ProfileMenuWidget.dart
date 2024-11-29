import 'package:flutter/material.dart';

import '../../Styles/Color/appTheme.dart';



class ProfileMenuWidget extends StatelessWidget {
  const ProfileMenuWidget({
    super.key,
    required this.title,
    required this.icon,
    required this.onPress,
    this.endIcon,
    this.textColor,
  });

  final String title;
  final IconData icon;
  final VoidCallback onPress;
  final bool? endIcon;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPress,
      leading: Container(
        width: 45,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: AppColors.buttonColor.withOpacity(0.2),
        ),
        child: Icon(
          icon,
          size: 24,
          color: Colors.black,
        ),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'RobotoSlab',
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: textColor ?? Colors.black,
        ),
      ),
      trailing: endIcon == true
          ? Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: AppColors.backgroundColor,
              ),
              child: const Icon(
                Icons.arrow_forward_ios,
                color: Colors.grey,
                size: 18,
              ),
            )
          : null,
    );
  }
}
