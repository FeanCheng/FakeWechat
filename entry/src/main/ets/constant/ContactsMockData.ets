import { ContactsUserGroupItemEntity } from '../entity/ContactsUserGroupItemEntity';
import { ContactsUserItemEntity } from '../entity/ContactsUserItemEntity';
export class ContactsMockData{


  static pinyinList(): string[] {
    return ["#", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P",
      "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"];
  }


  private static mockContactsList():ContactsUserItemEntity[]{
    let items = []
    for (let i = 0; i < 10; i++) {
      let item = new ContactsUserItemEntity($r("app.media.ic_my_default_avatar"),`用户名:${i}`,`当前是第${i}个用户`)
      items.push(item)
    }
    return items
  }
  static mockContactsGroupsList():ContactsUserGroupItemEntity[]{
    let items = []
    this.pinyinList().map((title)=>{
      let group = new ContactsUserGroupItemEntity(title,this.mockContactsList())
      items.push(group)
    })
    return items
  }



}