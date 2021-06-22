class FavouriteModel {

  int _id;
  String _title;
  String _name;
  String _location;
  String _registered;
  String _date;

  FavouriteModel(this._title, this._name, this._location, this._registered,
      this._date, this._priority);

  FavouriteModel.withId(this._id, this._title, this._name, this._location, this._registered,
      this._date, this._priority);


  String get name => _name;

  set name(String value) {
    _name = value;
  }

  int _priority;

  int get id => _id;

  String get title => _title;

  int get priority => _priority;

  String get date => _date;

  set title(String newTitle) {
    if (newTitle.length <= 255) {
      this._title = newTitle;
    }
  }


  set priority(int newPriority) {
    if (newPriority >= 1 && newPriority <= 2) {
      this._priority = newPriority;
    }
  }

  set date(String newDate) {
    this._date = newDate;
  }

  // Convert a Note object into a Map object
  Map<String, dynamic> toMap() {

    var map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = _id;
    }
    map['title'] = _title;
    map['name'] = _name;
    map['priority'] = _priority;
    map['date'] = _date;
    map['location']=_location;
    map['registered']=_registered;

    return map;
  }

  // Extract a Note object from a Map object
  FavouriteModel.fromMapObject(Map<String, dynamic> map) {
    this._id = map['id'];
    this._title = map['title'];
    this._name = map['name'];
    this._priority = map['priority'];
    this._date = map['date'];
    this.location=map['location'];
    this.registered=map['registered'];
  }

  String get location => _location;

  set location(String value) {
    _location = value;
  }

  String get registered => _registered;

  set registered(String value) {
    _registered = value;
  }
}
