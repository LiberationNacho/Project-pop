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

  List getEntries(){
    return _entries;
  }

  void addEntry(DiaryEntry entry){

  }

  void saveEntry(){

  }

  void removeEntry(DiaryEntry entry){

  }
}