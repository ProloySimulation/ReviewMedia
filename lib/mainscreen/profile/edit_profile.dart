import 'package:flutter/material.dart';
import 'package:review/util/Colors.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: backgroundColor,
        child: Column(
          children: [
            Container(
              color: Colors.white,
              child: Row(
                children: [
                  Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                        child: Image.asset('assets/images/login_oval_design.png',height: 100,width: 100,),
                      ),
                      Text("Profile Picture",style: TextStyle(color: themeColor),)
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
