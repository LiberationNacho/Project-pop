class DiaryEntry{
  late int _id;
  late String _content;

  DiaryEntry(){
    _content = "";
    _id = 0;
  }

  void setContent(String c){
    this._content = c;
  }

  String getContent(){
    return _content;
  }

  int getID(){
    return _id;
  }

  void addContent(String newContent){
    _content = newContent;
  }
}

class Diary extends DiaryEntry{
  late List<DiaryEntry> _entries;

  Diary() {
    _entries = [];
  }

  List getEntries(){
    return _entries;
  }

  void addEntry(DiaryEntry entry) {
    _entries.add(entry);
  }

  void saveEntry(){

  }

  void removeEntry(DiaryEntry entry) {
    _entries.remove(entry);
  }
}

class DiaryEntryUI {
  late DiaryEntry _diaryEntry;

  void setDiaryEntry(DiaryEntry entry) {
    _diaryEntry = entry;
  }

  void displayEntries() {
    // Use _diaryEntry to display entries
  }

  void editEntry() {
    // Use _diaryEntry to edit entries
  }
}

class DiaryUI{
  late Diary _diary;

  void setDiary(Diary diary){
    _diary = diary;
  }

  void displayEntries(){

  }

  void addEntry(){

  }

  void removeEntry(){

  }
}