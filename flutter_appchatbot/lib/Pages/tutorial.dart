import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appchatbot/Pages/tutorialdata.dart';
import 'package:flutter_appchatbot/main.dart';

import 'Navigator.dart';

class tutorial extends StatefulWidget {
  @override
  _tutorialState createState() => _tutorialState();
}

class _tutorialState extends State<tutorial> {

  List<TutorialModel> slides = new List<TutorialModel>();
  int currentIndex = 0;
  PageController pageController = new PageController(initialPage: 0);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    slides = getSlides();
  }

  Widget pageIndexIndicator(bool isCurrentPage){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2),
      height: isCurrentPage ? 10 : 8,
      width:  isCurrentPage ? 10 : 6,
      decoration: BoxDecoration(
          color: isCurrentPage ? Colors.grey : Colors.grey[300],
          borderRadius: BorderRadius.circular(12)
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        controller: pageController,
        itemCount: slides.length,
        onPageChanged: (val){
          setState(() {
            currentIndex == val;
          });
          currentIndex = val;
        } ,
        itemBuilder: (context, index){
          return TutorialTile(slides[index].getImageAssetPath(),slides[index].getWordString());
        },),
      bottomSheet: currentIndex != slides.length - 1 ? Container(

        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            GestureDetector(
              onTap: (){
                pageController.animateToPage(slides.length-1,duration: Duration(milliseconds: 400),curve: Curves.linear);
              },
              child: Text("SKIP"),
            ),
            Row(
              children: <Widget>[
                for(int i = 0; i<slides.length; i++)
                  currentIndex == i ?pageIndexIndicator(true) : pageIndexIndicator(false)

              ],
            ),
            GestureDetector(
              onTap: (){
                pageController.animateToPage(currentIndex+1,duration: Duration(milliseconds: 600),curve: Curves.linearToEaseOut);
              },
              child: Text("Next"),
            ),

          ],
        ),
      )
          : GestureDetector(
        onTap: (){
          Navigator.pushReplacement(context,PageRouteBuilder(
              transitionDuration: Duration(milliseconds: 600),
              transitionsBuilder: (BuildContext context,Animation<double> animation,Animation<double> secAnimation,Widget child){
                animation = CurvedAnimation(parent: animation,curve: Curves.linear);
                return ScaleTransition(
                  alignment: Alignment.center,
                  scale : animation,
                  child: child,
                );
              },
              pageBuilder: (BuildContext context,Animation<double> animation,Animation<double> secAnimation){
                return Nav();
              }
          ));
        },
        child: Container(
          alignment: Alignment.center,
          height: 60,
          color: Colors.red,
          child: Text("Let's Rock!",
            style: TextStyle(
                color: Colors.white,
                fontWeight:FontWeight.w600
            ),),
        ),
      ),
    );
  }
}

class TutorialTile extends StatelessWidget {
  String imageAssetPath,word;
  TutorialTile(this.imageAssetPath,this.word);
  @override
  Widget build(BuildContext context) {
    return
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          height:20
        ),
        Card(
          semanticContainer: true,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shadowColor: Colors.black,
          elevation: 9,
          shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15)
        ),
          child: new Image.asset(
            imageAssetPath,fit: BoxFit.fill, height: 600,width:300
            ),
        ),
        Container(
          child: Text((word) as String,style: TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: 18
          ),
           textAlign: TextAlign.center,
          ),
          height: 100,
        )
      ],
    );
  }
}

