class Note {
  int id;
  String noteTitle;
  String noteDetails;

  Note(
    this.id,
    this.noteDetails,
    this.noteTitle,
  );

  Map<String, dynamic> toMap() {
    return {
      'id': id == 0 ? null : id,
      'noteDetails': noteDetails,
      'noteTitle': noteTitle,
    };
  }
}
