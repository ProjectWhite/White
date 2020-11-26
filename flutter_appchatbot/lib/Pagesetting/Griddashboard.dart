import 'package:flutter/material.dart';
import 'package:flutter_appchatbot/Pagesetting/HelpCenter.dart';
import 'package:flutter_appchatbot/Pagesetting/RateUs.dart';
import 'package:google_fonts/google_fonts.dart';
import 'AccountPassword.dart';

class GridDashboard extends StatelessWidget {
  Items item1 = new Items(
    title: "Account & Password",
    subtitle: "Edit your account & password",
    ics: Icon(Icons.vpn_key_rounded, size: 60, color: Colors.white),
    page: AccountPasswordPage(),
  );

  Items item2 = new Items(
    title: "Rate Us",
    subtitle: "",
    ics: Icon(Icons.star_rate_rounded, size: 60, color: Colors.white),
    page: RatePage(),
  );
  Items item3 = new Items(
    title: "Help Center",
    subtitle: "",
    ics: Icon(Icons.live_help_rounded, size: 60, color: Colors.white),
    page: HelpCenterPage(),
  );

  @override
  Widget build(BuildContext context) {
    List<Items> myList = [item1, item2, item3];
    var color = Colors.blue[300];
    return Flexible(
      child: GridView.count(
          childAspectRatio: 1.0,
          padding: EdgeInsets.only(left: 16, right: 16),
          crossAxisCount: 2,
          crossAxisSpacing: 18,
          mainAxisSpacing: 18,
          children: myList.map((data) {
            return InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => data.page,),);
              },
              child: Material(
                color: color,
                elevation: 5,
                borderRadius: BorderRadius.circular(30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Center(
                          child: data.ics
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    Text(
                      data.title,
                      style: GoogleFonts.rubik(
                          textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 15.8,
                              fontWeight: FontWeight.w600)),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      data.subtitle,
                      style: GoogleFonts.rubik(
                          textStyle: TextStyle(
                              color: Colors.white70,
                              fontSize: 10,
                              fontWeight: FontWeight.w600)),
                    ),
                    SizedBox(
                      height: 14,
                    ),
                  ],
                ),
              ),
            );
          }).toList()),
    );
  }
}

class Items {
  var page;
  String title;
  String subtitle;
  Icon ics;
  Items({this.title, this.subtitle, this.ics, this.page});
}

class SlideFromLeftPageRoute extends PageRouteBuilder {
  Widget widget;

  SlideFromLeftPageRoute({this.widget}) : super(
    pageBuilder: (context, animation, secondaryAnimation) => widget,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(-1.0, 0.0),
          end: Offset.zero,
        ).animate(animation),
        child: SlideTransition(
          position: Tween<Offset>(
            begin: Offset.zero,
            end: const Offset(-1.0, 0.0),
          ).animate(secondaryAnimation),
          child: child,
        ),
      );
    },
  );
}