import { MessageSubscriptionCardItem } from './MessageSubscriptionCardItemEntity'
export class MessageSubscriptionCardGroupEntity{

  private _groupTitle: string
  private _groupList: Array<MessageSubscriptionCardItem>

  constructor(groupTitle: string, groupList: Array<MessageSubscriptionCardItem>){
    this._groupTitle = groupTitle
    this._groupList = groupList
  }

  get groupTitle(): string {
    return this._groupTitle
  }
  get groupList(): Array<MessageSubscriptionCardItem> {
    return this._groupList
  }


  static defaultData():MessageSubscriptionCardGroupEntity[]{
    return [
      new MessageSubscriptionCardGroupEntity("最新",MessageSubscriptionCardItem.defaultData()),
      new MessageSubscriptionCardGroupEntity("更早的消息",MessageSubscriptionCardItem.defaultData()),
    ]
  }


}