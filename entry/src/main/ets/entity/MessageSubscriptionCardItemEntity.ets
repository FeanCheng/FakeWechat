export class MessageSubscriptionCardItem{

  private _userAvatar:ResourceStr
  private _userName:string
  private _publishTime:string
  private _cover:ResourceStr
  private _title:string
  private _subTitle:string
  private _lookCount:string


constructor(userAvatar:ResourceStr,userName:string,publishTime:string,cover:ResourceStr,title:string,subTitle:string,lookCount:string){
    this._userAvatar = userAvatar
    this._userName = userName
    this._publishTime = publishTime
    this._cover = cover
    this._title = title
    this._subTitle = subTitle
    this._lookCount = lookCount
  }

  get userAvatar():ResourceStr{
    return this._userAvatar
  }
  get userName():string{
    return this._userName
  }
  get publishTime():string{
    return this._publishTime
  }
  get cover():ResourceStr{
    return this._cover
  }
  get title():string{
    return this._title
  }
  get subTitle():string{
    return this._subTitle
  }
  get lookCount():string{
    return this._lookCount
  }


  static defaultData():MessageSubscriptionCardItem[]{

    return [
      new MessageSubscriptionCardItem($r("app.media.ic_my_default_avatar"),'张三','2018-12-12',$r("app.media.ic_my_default_avatar"),'标题1','副标题1','100'),
      new MessageSubscriptionCardItem($r("app.media.ic_my_default_avatar"),'李四','2018-12-12',$r("app.media.ic_my_default_avatar"),'标题2','副标题2','100'),
      new MessageSubscriptionCardItem($r("app.media.ic_my_default_avatar"),'王五','2018-12-12',$r("app.media.ic_my_default_avatar"),'标题3','副标题3','100'),
      new MessageSubscriptionCardItem($r("app.media.ic_my_default_avatar"),'赵六','2018-12-12',$r("app.media.ic_my_default_avatar"),'标题4','副标题4','100'),
      new MessageSubscriptionCardItem($r("app.media.ic_my_default_avatar"),'张三','2018-12-12',$r("app.media.ic_my_default_avatar"),'标题5','副标题5','100'),
      new MessageSubscriptionCardItem($r("app.media.ic_my_default_avatar"),'李四','2018-12-12',$r("app.media.ic_my_default_avatar"),'标题6','副标题6','100'),
      new MessageSubscriptionCardItem($r("app.media.ic_my_default_avatar"),'王五','2018-12-12',$r("app.media.ic_my_default_avatar"),'标题7','副标题7','100'),
      new MessageSubscriptionCardItem($r("app.media.ic_my_default_avatar"),'赵六','2018-12-12',$r("app.media.ic_my_default_avatar"),'标题8','副标题8','100'),
      new MessageSubscriptionCardItem($r("app.media.ic_my_default_avatar"),'张三','2018-12-12',$r("app.media.ic_my_default_avatar"),'标题9','副标题9','100'),
      new MessageSubscriptionCardItem($r("app.media.ic_my_default_avatar"),'李四','2018-12-12',$r("app.media.ic_my_default_avatar"),'标题10','副标题10','100'),
      new MessageSubscriptionCardItem($r("app.media.ic_my_default_avatar"),'王五','2018-12-12',$r("app.media.ic_my_default_avatar"),'标题11','副标题11','100')
      ]
  }
}