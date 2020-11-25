import 'package:flutter/material.dart';
import 'package:flutter_appchatbot/Pagesetting/help_center.dart';
import 'package:flutter_appchatbot/Pagesetting/prefered_hours.dart';
import 'package:flutter_appchatbot/Pagesetting/rate_us.dart';
import 'package:flutter_appchatbot/Pagesetting/security.dart';
import 'package:flutter_appchatbot/Pagesetting/theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'account_password.dart';


class GridDashboard extends StatelessWidget {
  Items item1 = new Items(
    title: "Account & Password",
    subtitle: "Edit your account & password",
    ics: Icon(Icons.vpn_key_rounded, size: 60, color: Colors.blue),
    page: AccountPasswordPage(),
  );

  Items item2 = new Items(
    title: "Theme",
    subtitle: "Change theme app",
    ics: Icon(Icons.color_lens_rounded, size: 60, color: Colors.blue),
    page: ThemePage(),
  );
  Items item3 = new Items(
    title: "Preferred Hours",
    subtitle: "Select your preferred hours",
    ics: Icon(Icons.access_time_rounded, size: 60, color: Colors.blue),
    page: PreferedHoursPage(),
  );
  Items item4 = new Items(
    title: "Security",
    subtitle: "Set PIN",
    ics: Icon(Icons.lock_rounded, size: 60, color: Colors.blue),
    page: SecurityPage(),
  );
  Items item5 = new Items(
    title: "Rate Us",
    subtitle: "",
    ics: Icon(Icons.star_rate_rounded, size: 60, color: Colors.blue),
    page: RatePage(),
  );
  Items item6 = new Items(
    title: "Help Center",
    subtitle: "",
    ics: Icon(Icons.live_help_rounded, size: 60, color: Colors.blue),
    page: HelpCenterPage(),
  );


  @override
  Widget build(BuildContext context) {
    List<Items> myList = [item1, item2, item3, item4, item5, item6];
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
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => data.page));
              },
              child: Material(
                elevation: 10,
                color: color,
                borderRadius: BorderRadius.circular(30),
                child: Container(
                  decoration: BoxDecoration(
                      color: color, borderRadius: BorderRadius.circular(30)),
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
                        style: GoogleFonts.robotoCondensed(
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
                        style: GoogleFonts.robotoCondensed(
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