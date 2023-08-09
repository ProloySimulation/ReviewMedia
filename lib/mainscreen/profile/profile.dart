import 'package:flutter/material.dart';
import 'package:review/mainscreen/profile/api_service.dart';
import 'package:review/util/Colors.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  List<Map<String, dynamic>> _userData = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getProfile();
  }

  void _getProfile() async
  {
    Map<String, dynamic>? response = await ApiService.getProfile();

    if (response != null && response.containsKey('user') && response['user'] is List) {
      setState(() {
        _userData = List.from(response['user']);
      });
    } else {
      // Handle the case when the response is null or the structure is unexpected.
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      child: Column(
        children: [
          Container(
            color:Colors.white,
            child:Padding(
              padding: EdgeInsets.all(20),
              child: Row(
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
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(_userData[0]['name'],
                          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
                        Text("Dhaka, Bangladesh",
                          style: TextStyle(color: hintTextColor),),
                        SizedBox(height: 20,),
                        Row(
                          children: [
                            GestureDetector(child: Image.asset('assets/images/ic_edit_profile.png',)),
                            Text("Edit Profile")
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 5,),
          Container(
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("About",
                          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
                      Text("Demo data",
                        style: TextStyle(color: hintTextColor),)
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 5,),
          Column(
            children: [
              Container(
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('company_name',style: TextStyle(color: hintTextColor),),
                      SizedBox(height: 15,),
                      Row(
                        children: [
                          Text('name',style: TextStyle(
                              fontWeight: FontWeight.bold
                          ),),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Text('description'),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          Image.asset('assets/images/ic_clock_time.png'),
                          SizedBox(width: 5,),
                          Text('address_details',style: TextStyle(color: hintTextColor,fontSize: 10),)
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 2,),
              Container(
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Image.asset('assets/images/ic_like.png'),
                      SizedBox(width: 5,),
                      Text("0"),
                      SizedBox(width: 50,),
                      Image.asset('assets/images/ic_dislike.png'),
                      SizedBox(width: 5,),
                      Text("0"),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10,)
            ],
          )
        ],
      ),
    );
  }
}
