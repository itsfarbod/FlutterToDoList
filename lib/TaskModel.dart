class TaskModel {
  String _title;
  String _description;
  bool _isDone;
  DateTime _time;

  TaskModel(this._title , this._description , this._isDone , this._time);
  bool get isDone => _isDone;
  void setIsDone(bool state) {
    this._isDone = state;
  }

  String get description => _description;
  set setDescription(String value) {
    this._description = value;
  }

  String get title => _title;
  set setTitle(String value) {
    this._title = value;
  }

  DateTime get time => _time;
  set setTime(DateTime value) {
    this._time = value;
  }
}