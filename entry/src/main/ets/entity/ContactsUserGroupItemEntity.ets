import { ContactsUserItemEntity } from './ContactsUserItemEntity'
export class ContactsUserGroupItemEntity{

  private _groupTitle:string
  private _userList:ContactsUserItemEntity[]


  constructor(groupTitle:string,userList:ContactsUserItemEntity[]){
    this._groupTitle = groupTitle
    this._userList = userList
  }
  get groupTitle():string{
    return this._groupTitle
  }
  get userList():ContactsUserItemEntity[]{
    return this._userList
  }
}