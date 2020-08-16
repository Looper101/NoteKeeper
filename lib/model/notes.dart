class Note {
  String noteTitle;
  String noteDetails;
  bool isDone;
  Note({this.noteDetails, this.noteTitle, this.isDone = false});

  void toggleDone() {
    isDone = !isDone;
  }
}
