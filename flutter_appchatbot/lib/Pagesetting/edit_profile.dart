import 'package:flutter/material.dart';
import 'package:flutter_appchatbot/main.dart';
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
            fontFamily: 'RobotoCondensed',
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
                  fontFamily: 'RobotoCondensed',
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
                          image: NetworkImage('https://lh3.googleusercontent.com/proxy/Q4NaPAEQ_dNvSParOnNGEADJoeyGPsNVAB2HYmCAgUC2JjWZAGpwkHUXpP7iHupq7K2uE99NdvJ7s2oFDmoV-ulHBYI-j7Cvm84n9Ft5k_82ap7rCjK0W5HoBJtsbqvGXkn1uZrvBvIAxfMPmKHNcURRG9-H-Hxp'),
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
              buildInkWell('Nickname', ChangeNickname(), name),
              SizedBox(
                height: 25,
              ),
              RaisedButton(
                onPressed: (){},
                color: Colors.blue[400],
                padding: EdgeInsets.symmetric(horizontal: 50),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                child: Text(
                  ' Delete Account ',
                  style: TextStyle(
                    fontSize: 16,
                    letterSpacing: 2.2,
                    color: Colors.white,
                    fontFamily: 'RobotoCondensed',
                  ),
                ),
              ),
              SizedBox(height: 40,),
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
                        fontFamily: 'RobotoCondensed',
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
                        fontFamily: 'RobotoCondensed',
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
  InkWell buildInkWell(String textTitle, page, textBehide) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => page));
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(textTitle, style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.w400,fontFamily: 'RobotoCondensed',
            ),),
            Row(
              children: [
                Text(textBehide, style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w300,
                    fontStyle: FontStyle.italic
                ),),
                SizedBox(width: 10),
                Icon(Icons.arrow_forward_ios_rounded, color: Colors.grey[600],
                    size: 18)
              ],
            ),
          ],
        ),
      ),
    );
  }
}


class ChangeNickname extends StatefulWidget {
  @override
  _ChangeNicknameState createState() => _ChangeNicknameState();
}

class _ChangeNicknameState extends State<ChangeNickname> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Nickname',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontFamily: 'RobotoCondensed',
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

      ),
    );
  }
}

