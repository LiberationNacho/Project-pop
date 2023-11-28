class Inventory
{
  int _StoreName = 0; //0 = 옷, 1 = 가구, 2 = 음악 상점
  int _SelectItem = 0; //다양한 아이템 중 어떤 아이템을 선택했는지 체크하는 변수

  void ChooseStoreName(int num)
  {
    this._StoreName = num;
  }

  void ChooseItem(int num)
  {
    this._SelectItem = num;
  }
}

class InventoryUI
{
  
}