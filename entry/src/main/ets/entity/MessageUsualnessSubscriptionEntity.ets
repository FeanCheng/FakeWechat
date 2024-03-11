export class MessageUsualnessSubscriptionEntity{

  private _avatar:ResourceStr
  private _hasNewMessage:boolean

  constructor(avatar:ResourceStr,hasNewMessage:boolean){
    this._avatar = avatar
    this._hasNewMessage = hasNewMessage
  }
  get avatar():ResourceStr{
    return this._avatar
  }
  get hasNewMessage():boolean{
    return this._hasNewMessage
  }


  static defaultData():MessageUsualnessSubscriptionEntity[]{
    return [
      new MessageUsualnessSubscriptionEntity($r("app.media.ic_my_default_avatar"),true),
      new MessageUsualnessSubscriptionEntity($r("app.media.ic_my_default_avatar"),true),
      new MessageUsualnessSubscriptionEntity($r("app.media.ic_my_default_avatar"),true),
      new MessageUsualnessSubscriptionEntity($r("app.media.ic_my_default_avatar"),true),
      new MessageUsualnessSubscriptionEntity($r("app.media.ic_my_default_avatar"),true),
      new MessageUsualnessSubscriptionEntity($r("app.media.ic_my_default_avatar"),false),
      new MessageUsualnessSubscriptionEntity($r("app.media.ic_my_default_avatar"),false)
      ]
  }


}