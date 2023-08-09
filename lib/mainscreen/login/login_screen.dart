import 'package:flutter/material.dart';
import 'package:review/mainscreen/login/api_service.dart';
import 'package:review/style/rounded_text_box.dart';
import 'package:review/util/Colors.dart';

class LoginScreen extends StatefulWidget {

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _nameController = TextEditingController();

  void _handleSignUp() async
  {
    String email = _emailController.text;
    String name = _nameController.text;

    Map<String, dynamic> response = await ApiService.signUp(name, email);
    if(response !=null)
      {
        Navigator.pushNamed(context, '/otp');
      }
    else
      {

      }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          child: Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Name",style: TextStyle(
                                color: themeColor,
                                fontSize: 20
                            ),),
                            SizedBox(height: 10,),
                            RoundedTextBox(
                              hintText: 'Your Name',
                              controller: _nameController,
                              borderColor: themeColor,
                              borderRadius: 20.0,
                              borderWidth: 2.0,
                              padding: 10.0,
                            ),
                            SizedBox(height: 20,),
                            Text("Email",style: TextStyle(
                                color: themeColor,
                                fontSize: 20
                            ),),
                            SizedBox(height: 10,),
                            RoundedTextBox(
                              hintText: 'Your Email',
                              controller: _emailController,
                              borderColor: Colors.black,
                              borderRadius: 20.0,
                              borderWidth: 2.0,
                              padding: 10.0,
                            ),
                          ],
                        ),
                        SizedBox(height: 40,),
                        ElevatedButton(
                          onPressed: () {
                            _handleSignUp();
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10), // Set the border radius here
                            ),
                            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24), // Adjust the padding as needed
                            primary: themeColor, // Set the button color
                            onPrimary: Colors.white, // Set the text color
                          ),
                          child: Text('Get Verification Code',style: TextStyle(
                            fontSize: 15
                          ),),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: Image.asset(
                  'assets/images/login_oval_design.png',
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
