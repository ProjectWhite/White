import 'package:flutter/material.dart';
import 'Diary.dart';

class DiarysSearch extends SearchDelegate<Diary> {
  final List<Diary> diarys;
  List<Diary> filteredDiarys = [];
  DiarysSearch({this.diarys});

  @override
  ThemeData appBarTheme(BuildContext context) {
    assert(context != null);
    final ThemeData theme = Theme.of(context).copyWith(
        hintColor: Colors.grey,
        primaryColor: Colors.white,
        textTheme: TextTheme(
          title: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
        ));
    assert(theme != null);
    return theme;
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(
          Icons.clear,
          color: Colors.black,
        ),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.arrow_back,
        color: Colors.black,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query == '') {
      return Container(
        color: Colors.white,
        child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: 50,
                  height: 50,
                  child: Icon(
                    Icons.search,
                    size: 50,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  'Enter a diary to search.',
                  style: TextStyle(color: Colors.grey),
                )
              ],
            )),
      );
    } else {
      filteredDiarys = [];
      getFilteredList(diarys);
      if (filteredDiarys.length == 0) {
        return Container(
          color: Colors.white,
          child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    width: 50,
                    height: 50,
                    child: Icon(
                      Icons.sentiment_dissatisfied,
                      size: 50,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    'No results found',
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              )),
        );
      } else {
        return Container(
          color: Colors.white,
          child: ListView.builder(
            itemCount: filteredDiarys.length == null ? 0 : filteredDiarys.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Icon(
                  Icons.note_add_rounded,
                  color: Colors.grey[800],
                ),
                // title: Text(
                //   filteredDiarys[index].title,
                //   style: TextStyle(
                //       fontWeight: FontWeight.bold,
                //       fontSize: 18.0,
                //       color: Colors.grey[800]),
                // ),
                subtitle: Text(
                  filteredDiarys[index].description,
                  style: TextStyle(fontSize: 14.0, color: Colors.grey),
                ),
                onTap: () {
                  close(context, filteredDiarys[index]);
                },
              );
            },
          ),
        );
      }
    }
  }

  List<Diary> getFilteredList(List<Diary> diary) {
    for (int i = 0; i < diary.length; i++) {
      if (
      // diary[i].title.toLowerCase().contains(query) ||
          diary[i].description.toLowerCase().contains(query)) {
        filteredDiarys.add(diary[i]);
      }
    }
    return filteredDiarys;
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query == '') {
      return Container(
        color: Colors.white,
        child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: 50,
                  height: 50,
                  child: Icon(
                    Icons.search,
                    size: 50,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  'Enter a diary to search.',
                  style: TextStyle(color: Colors.grey),
                )
              ],
            )),
      );
    } else {
      filteredDiarys = [];
      getFilteredList(diarys);
      if (filteredDiarys.length == 0) {
        return Container(
          color: Colors.white,
          child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    width: 50,
                    height: 50,
                    child: Icon(
                      Icons.sentiment_dissatisfied,
                      size: 50,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    'No results found',
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              )),
        );
      } else {
        return Container(
          color: Colors.white,
          child: ListView.builder(
            itemCount: filteredDiarys.length == null ? 0 : filteredDiarys.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Icon(
                  Icons.note_add_rounded,
                  color: Colors.grey[800],
                ),
                // title: Text(
                //   filteredDiarys[index].title,
                //   style: TextStyle(
                //       fontWeight: FontWeight.bold,
                //       fontSize: 18.0,
                //       color: Colors.grey[800]),
                // ),
                subtitle: Text(
                  filteredDiarys[index].description,
                  style: TextStyle(fontSize: 14.0, color: Colors.grey),
                ),
                onTap: () {
                  close(context, filteredDiarys[index]);
                },
              );
            },
          ),
        );
      }
    }
  }
}