import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appchatbot/Pages/data.dart';
import 'package:flutter_appchatbot/main.dart';

class intro extends StatefulWidget {
  @override
  _introState createState() => _introState();
}

class _introState extends State<intro> {

  List<SliderModel> slides = new List<SliderModel>();
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
        controller: pageController,
        itemCount: slides.length,
        onPageChanged: (val){
          setState(() {
            currentIndex == val;
          });
          currentIndex = val;
        } ,
        itemBuilder: (context, index){
          return SliderTile(slides[index].getImageAssetPath(), slides[index].getTitle(), slides[index].getDesc());
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
                transitionDuration: Duration(milliseconds: 1500),
                transitionsBuilder: (BuildContext context,Animation<double> animation,Animation<double> secAnimation,Widget child){
                  animation = CurvedAnimation(parent: animation,curve: Curves.easeInOutQuint);
                  return ScaleTransition(
                    alignment: Alignment.bottomCenter,
                      scale : animation,
                    child: child,
                  );
                },
                pageBuilder: (BuildContext context,Animation<double> animation,Animation<double> secAnimation){
                  return MyHomePage();
              }
              ));
            },
        child: Container(
          alignment: Alignment.center,
          height: 60,
          color: Colors.deepPurple,
            child: Text("GET STARTED",
            style: TextStyle(
                color: Colors.white,
              fontWeight:FontWeight.w600
            ),),
        ),
      ),
    );
  }
}

class SliderTile extends StatelessWidget {
  String imageAssetPath,title, desc;
  SliderTile(this.imageAssetPath,this.title,this.desc);
  @override
  Widget build(BuildContext context) {
    return Image.asset(imageAssetPath);
  }
}

