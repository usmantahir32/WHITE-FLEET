class Event{
  final String title;
  // final EventType eventType;
  Event( { required this.title});
  String toStri8ng()=>this.title;
}

enum EventType{
  my,
  open,
  inProgress
}