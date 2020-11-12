import 'package:flutter/material.dart';
import 'package:flutter_appchatbot/Pagesetting/checkpassword.dart';
import 'package:flutter_appchatbot/Pagesetting/editpassword.dart';
import 'package:flutter_appchatbot/main.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;


class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  bool showPassword = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Profile',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue[400],
        elevation: 15,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.blue[100],
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              Text(
                'Edit Profile',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 4,
                          color: Theme.of(context).scaffoldBackgroundColor,
                        ),
                        boxShadow: [
                          BoxShadow(
                            spreadRadius: 2,
                            blurRadius: 10,
                            color: Colors.black.withOpacity(0.1),
                            offset: Offset(0,10),
                          )
                        ],
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: new ExactAssetImage('assets/aoy.jpg'),
                        )
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,

                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blue[300],
                        ),
                        child: Icon(Icons.edit, color: Colors.white,),
                      )
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 35,
              ),
              buildTextField('Username', username, false),
              buildTextField('Email','', false),
              buildTextField('Password','********', true),
              // SizedBox(
              //   height: 25,
              // ),
              // RaisedButton(
              //   onPressed: (){
              //     var url="$uml/my_store/delete.php";
              //     print(username);
              //     http.post(url,body:{
              //       'username' : username,
              //     });
              //     Navigator.push(context, MaterialPageRoute(builder: (context)=>MyHomePage(),),);
              //     Fluttertoast.showToast(
              //         msg: "Delete Successful",
              //         toastLength: Toast.LENGTH_SHORT,
              //         gravity: ToastGravity.BOTTOM,
              //         timeInSecForIosWeb: 1,
              //         backgroundColor: Colors.black,
              //         textColor: Colors.white,
              //         fontSize: 16.0
              //     );
              //   },
              //   color: Colors.blue[400],
              //   padding: EdgeInsets.symmetric(horizontal: 50),
              //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              //   child: Text(
              //     ' Delete Account ',
              //     style: TextStyle(
              //       fontSize: 16,
              //       letterSpacing: 2.2,
              //       color: Colors.white,
              //     ),
              //   ),
              // ),
              // SizedBox(height: 40,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlineButton(
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    onPressed: (){
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'CANCLE',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2.2,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  RaisedButton(
                    onPressed: (){},
                    color: Colors.blue[400],
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    child: Text(
                      ' SAVE ',
                      style: TextStyle(
                        fontSize: 16,
                        letterSpacing: 2.2,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 40,),
              Center(
                child: RaisedButton(
                  onPressed: (){
                    var url="$uml/my_store/delete.php";
                    print(username);
                    http.post(url,body:{
                      'username' : username,
                    });
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>MyHomePage(),),);
                    Fluttertoast.showToast(
                        msg: "Delete Successful",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.black,
                        textColor: Colors.white,
                        fontSize: 16.0
                    );
                  },
                  color: Colors.blue[400],
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(60)),
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: SizedBox(
                    width: 130,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Delete Account',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontFamily: 'RobotoCondensed',
                          ),
                        ),
                        SizedBox(width: 8),
                        Icon(Icons.logout, color: Colors.white,size: 20,),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(String labelText, String placeholder, bool isPasswordTextfield) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35.0),
      child: TextField(
        obscureText: isPasswordTextfield ? showPassword : false,
        decoration: InputDecoration(
          suffixIcon: isPasswordTextfield ? IconButton(
            onPressed: () {

              Navigator.push(context, MaterialPageRoute(builder: (context)=>checkpass(),),);
              setState(() {
                showPassword = !showPassword;
              });
            },
            icon : Icon(
              Icons.edit,
              color: Colors.grey,
            ),
          ): null,
          contentPadding: EdgeInsets.only(bottom: 3),
          labelText: labelText,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: placeholder,
          hintStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}

