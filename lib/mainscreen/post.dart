import 'package:flutter/material.dart';
import 'package:review/mainscreen/api_service.dart';
import 'package:review/style/rounded_text_box.dart';
import 'package:review/style/tag_input_box.dart';
import 'package:review/util/Colors.dart';

class Post extends StatefulWidget {
  const Post({Key? key}) : super(key: key);

  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
  List <String> allTags = [];

  final TextEditingController _companyController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();

  void _updateTags(List<String> tags) {
    setState(() {
      allTags = tags;
    });
  }

  void _postReview() async{
    String companyName = _companyController.text;
    String description = _descriptionController.text;
    String location = _locationController.text;

    Map<String, dynamic> response = await ApiService.postReview(companyName,description,location,allTags);
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
    return Scaffold(
      /*appBar: AppBar(
        title: Text('Review'),
        // backgroundColor: navBarColor,
      ),*/
      body: SingleChildScrollView(
        child: Container(
          color: backgroundColor,
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: EdgeInsets.only(bottom: 60,left: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: themeColor,
                          width: 1,
                        ),
                      ),
                      child: TextField(
                        controller: _descriptionController,
                        maxLines: null,
                        maxLength: 400,
                        decoration: InputDecoration(
                            hintText: "Share your thoughts. . .",
                            border: InputBorder.none,
                            counterText: ''
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Text("Save as draft",style: TextStyle(
                        color: themeColor,fontWeight: FontWeight.bold
                    ),),
                    SizedBox(height: 20,),
                    ElevatedButton(
                      onPressed: () {
                        _postReview();
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10), // Set the border radius here
                        ),
                        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24), // Adjust the padding as needed
                        primary: themeColor, // Set the button color
                        onPrimary: Colors.white, // Set the text color
                      ),
                      child: Text('Post',style: TextStyle(
                          fontSize: 15
                      ),),
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Type Categories",style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,fontWeight: FontWeight.bold
                    ),),
                    SizedBox(height: 5,),
                    RoundedTextBox(
                      hintText: 'Categories',
                      controller: TextEditingController(),
                      borderColor: themeColor,
                      borderRadius: 10.0,
                      borderWidth: 1.0,
                      padding: 6.0,
                    ),

                    SizedBox(height: 20,),
                    Text("Company Name",style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,fontWeight: FontWeight.bold
                    ),),
                    SizedBox(height: 5,),
                    RoundedTextBox(
                      hintText: 'Type Here',
                      controller: _companyController,
                      borderColor: themeColor,
                      borderRadius: 10.0,
                      borderWidth: 1.0,
                      padding: 6.0,
                    ),

                    SizedBox(height: 20,),
                    Text("Location",style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,fontWeight: FontWeight.bold
                    ),),
                    SizedBox(height: 5,),
                    RoundedTextBox(
                      hintText: 'Type Here',
                      controller: _locationController,
                      borderColor: themeColor,
                      borderRadius: 10.0,
                      borderWidth: 1.0,
                      padding: 6.0,
                    ),

                    SizedBox(height: 20,),
                    Text("Tags",style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,fontWeight: FontWeight.bold
                    ),),
                    SizedBox(height: 5,),
                    TagBox(onTagsUpdate: _updateTags),
                    /*RoundedTextBox(
                      hintText: 'Type Your Tags',
                      controller: TextEditingController(),
                      borderColor: themeColor,
                      borderRadius: 10.0,
                      borderWidth: 1.0,
                      padding: 6.0,
                    ),*/
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
