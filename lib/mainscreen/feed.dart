import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:review/mainscreen/api_service.dart';
import 'package:review/util/Colors.dart';

class Feed extends StatefulWidget {
  const Feed({Key? key}) : super(key: key);

  @override
  State<Feed> createState() => _FeedState();
}

class _FeedState extends State<Feed> {

  List<Map<String, dynamic>> _reviewList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getReview();
  }

  void _getReview() async
  {
    Map<String, dynamic>? response = await ApiService.getReview();

    if (response != null && response.containsKey('review') && response['review'] is List) {
      setState(() {
        _reviewList = List.from(response['review']);
      });
    } else {
      // Handle the case when the response is null or the structure is unexpected.
    }
  }

  /*@override
  void initState() {
    super.initState();
    print("User Token: $userToken"); // Print the userToken variable
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: backgroundColor,
        child: Padding(
          padding: EdgeInsets.all(10),
          child: ListView.builder(
            itemCount: _reviewList.length,
            itemBuilder: (BuildContext context, int index)
              {
                final data = _reviewList[index];
                return Column(
                  children: [
                    Container(
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(data['company_name'],style: TextStyle(color: hintTextColor),),
                            SizedBox(height: 15,),
                            Row(
                              children: [
                                Text(data['name'],style: TextStyle(
                                    fontWeight: FontWeight.bold
                                ),),
                              ],
                            ),
                            SizedBox(height: 10,),
                            Text(data['description']),
                            SizedBox(height: 10,),
                            Row(
                              children: [
                                Image.asset('assets/images/ic_clock_time.png'),
                                SizedBox(width: 5,),
                                Text(data['address_details'],style: TextStyle(color: hintTextColor,fontSize: 10),)
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
                );
              }
          ),
        ),
      ),
    );
  }
}
