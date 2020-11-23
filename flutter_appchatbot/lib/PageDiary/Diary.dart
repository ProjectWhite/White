class Diary {
  int _id;
  // String _title;
  String _description;
  String _date;
  int _priority, _color;

  Diary(this._date, this._priority, this._color,
      [this._description]);

  Diary.withId(this._id, this._date, this._priority, this._color,
      [this._description]);

  int get id => _id;

  // String get title => _title;

  String get description => _description;
  int get priority => _priority;
  int get color => _color;
  String get date => _date;

  // set title(String newTitle) {
  //   if (newTitle.length <= 255) {
  //     this._title = newTitle;
  //   }
  // }

  set description(String newDescription) {
      this._description = newDescription;
  }

  set priority(int newPriority) {
    if (newPriority >= 1 && newPriority <= 3) {
      this._priority = newPriority;
    }
  }

  set color(int newColor) {
    if (newColor >= 0 && newColor <= 9) {
      this._color = newColor;
    }
  }

  set date(String newDate) {
    this._date = newDate;
  }

  // Convert a Diary object into a Map object
  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = _id;
    }
    // map['title'] = _title;
    map['description'] = _description;
    map['priority'] = _priority;
    map['color'] = _color;
    map['date'] = _date;

    return map;
  }

  // Extract a Diary object from a Map object
  Diary.fromMapObject(Map<String, dynamic> map) {
    this._id = map['id'];
    // this._title = map['title'];
    this._description = map['description'];
    this._priority = map['priority'];
    this._color = map['color'];
    this._date = map['date'];
  }
}
