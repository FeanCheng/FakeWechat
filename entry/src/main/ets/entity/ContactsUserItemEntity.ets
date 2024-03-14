export class ContactsUserItemEntity{

  private _avatar:ResourceStr
  private _nickName:string
  private _desc:string

  constructor(avatar:ResourceStr,nickName:string,desc:string){
    this._avatar = avatar
    this._nickName = nickName
    this._desc = desc
  }

  get avatar():ResourceStr{
    return this._avatar
  }
  get nickName():string{
    return this._nickName
  }
  get desc():string{
    return this._desc
  }


}