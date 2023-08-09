import 'package:flutter/material.dart';
import 'package:review/mainscreen/login/api_service.dart';
import 'package:review/style/rounded_text_box.dart';
import 'package:review/util/Colors.dart';
import 'package:review/util/SharedPreferences.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {

  final TextEditingController _otpController = TextEditingController();

  void _handleVerification() async
  {
    String otp = _otpController.text;

    Map<String, dynamic> response = await ApiService.otpVerification(otp);
    if(response !=null)
    {
      String token = response['token'];
      setUserTokenPreferences('USER_TOKEN',token);
      print("USER_TOKEN: $token");
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
                        Text("Verification Code",style: TextStyle(
                            color: themeColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 25
                        ),),
                        SizedBox(height: 20,),
                        Text("Enter the code we sent to",style: TextStyle(
                            color: themeColor,
                            fontSize: 15
                        ),),
                        Text("proloy.olmg@gmail.com",style: TextStyle(
                            color: themeColor,
                            fontSize: 15
                        ),),
                        SizedBox(height: 30,),
                        RoundedTextBox(
                          hintText: 'Enter Code',
                          controller: _otpController,
                          borderColor: themeColor,
                          borderRadius: 20.0,
                          borderWidth: 2.0,
                          padding: 10.0,
                          maxCharacters: 6,
                        ),
                        SizedBox(height: 20,),
                        ElevatedButton(
                          onPressed: () {
                            _handleVerification();
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10), // Set the border radius here
                            ),
                            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24), // Adjust the padding as needed
                            primary: themeColor, // Set the button color
                            onPrimary: Colors.white, // Set the text color
                          ),
                          child: Text('Verify',style: TextStyle(
                              fontSize: 15
                          ),),
                        ),
                        SizedBox(height: 20,),
                        Text("Resend",style: TextStyle(
                            color: themeColor,
                            fontSize: 15
                        ),),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Image.asset(
                  'assets/images/otp_oval_design.png',
                  /*  width: 50,  // Adjust the width as needed
              height: 50, */// Adjust the height as needed
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
