import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:review/util/Colors.dart';

class HomeAppbar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Row(
        children: [
          GestureDetector(
            // onTap: onLogoPressed, // Call the method when the logo is pressed
            child: SvgPicture.asset(
              'assets/images/ic_review_icon.svg',
              width: 40,
              height: 40,
            ),
          ),
          Spacer(),
          IconButton(
            icon: Icon(Icons.search,color: hintTextColor,),
            onPressed: () {
              // Add your search icon functionality
            },
          ),
          IconButton(
            icon: Icon(Icons.notifications,color: hintTextColor,),
            onPressed: () {
              // Add your notifications icon functionality
            },
          ),
        ],
      ),
    );
  }
}
