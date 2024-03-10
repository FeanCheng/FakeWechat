import { MessageConversationType } from '../MessageConversationType'

export class MessageConversationItemEntity {

  /**
   * 会话类型
   */
  private _conversationType: MessageConversationType = MessageConversationType.PRIVATE
  /**
   * 头像
   */
  private _avatar: ResourceStr
  /**
   * 昵称
   */
  private _nickName: string
  /**
   * 描述
   */
  private _desc: string
  /**
   * 未读数
   */
  private _unreadCount: number
  /**
   * 时间
   */
  private _time: string

  constructor(avatar: ResourceStr,
              nickName: string,
              desc: string,
              unreadCount: number = 0,
              time?: string,
              conversationType: MessageConversationType = MessageConversationType.PRIVATE) {
    {
      this._avatar = avatar;
      this._nickName = nickName;
      this._desc = desc;
      this._unreadCount = unreadCount;
      this._time = time !== null ? time : "";
      this._conversationType = conversationType
    }
  }

  get avatar(): ResourceStr {
    return this._avatar;
  }

  get nickName(): string {
    return this._nickName;
  }

  get desc(): string {
    return this._desc;
  }

  get unreadCount(): number {
    return this._unreadCount;
  }

  get time(): string {
    return this._time;
  }


  static defaultConversations(conversationType: MessageConversationType) {
    if (conversationType === MessageConversationType.PRIVATE) {
      return [
        new MessageConversationItemEntity($r("app.media.ic_my_default_avatar"), '小明', '你好', 0, '2020-12-12', conversationType),
        new MessageConversationItemEntity($r("app.media.ic_my_default_avatar"), '小红', '你好', 1999, '2020-12-12', conversationType),
        new MessageConversationItemEntity($r("app.media.ic_my_default_avatar"), '小刚', '你好', 2, '2020-12-12', conversationType),
        new MessageConversationItemEntity($r("app.media.ic_my_default_avatar"), '小李', '你好', 3, '2020-12-12', conversationType),
        new MessageConversationItemEntity($r("app.media.ic_my_default_avatar"), '小张', '你好', 4, '2020-12-12', conversationType),
        new MessageConversationItemEntity($r("app.media.ic_my_default_avatar"), '小王', '你好', 5, '2020-12-12', conversationType),
        new MessageConversationItemEntity($r("app.media.ic_my_default_avatar"), '小赵', '你好', 6, '2020-12-12', conversationType),
        new MessageConversationItemEntity($r("app.media.ic_my_default_avatar"), '小钱', '你好', 7, '2020-12-12', conversationType),
        new MessageConversationItemEntity($r("app.media.ic_my_default_avatar"), '小孙', '你好', 8, '2020-12-12', conversationType),
        new MessageConversationItemEntity($r("app.media.ic_my_default_avatar"), '小杨', '你好', 9, '2020-12-12', conversationType),
        new MessageConversationItemEntity($r("app.media.ic_my_default_avatar"), '小锅', '你好', 9, '2020-12-12', conversationType),
        new MessageConversationItemEntity($r("app.media.ic_my_default_avatar"), '小罗', '你好', 9, '2020-12-12', conversationType),
        new MessageConversationItemEntity($r("app.media.ic_my_default_avatar"), '小明1', '你好', 0, '2020-12-12', conversationType),
        new MessageConversationItemEntity($r("app.media.ic_my_default_avatar"), '小红1', '你好', 1999, '2020-12-12', conversationType),
        new MessageConversationItemEntity($r("app.media.ic_my_default_avatar"), '小刚1', '你好', 2, '2020-12-12', conversationType),
        new MessageConversationItemEntity($r("app.media.ic_my_default_avatar"), '小李1', '你好', 3, '2020-12-12', conversationType),
        new MessageConversationItemEntity($r("app.media.ic_my_default_avatar"), '小张1', '你好', 4, '2020-12-12', conversationType),
        new MessageConversationItemEntity($r("app.media.ic_my_default_avatar"), '小王1', '你好', 5, '2020-12-12', conversationType),
        new MessageConversationItemEntity($r("app.media.ic_my_default_avatar"), '小赵1', '你好', 6, '2020-12-12', conversationType),
        new MessageConversationItemEntity($r("app.media.ic_my_default_avatar"), '小钱1', '你好', 7, '2020-12-12', conversationType),
        new MessageConversationItemEntity($r("app.media.ic_my_default_avatar"), '小孙1', '你好', 8, '2020-12-12', conversationType),
        new MessageConversationItemEntity($r("app.media.ic_my_default_avatar"), '小杨1', '你好', 9, '2020-12-12', conversationType),
        new MessageConversationItemEntity($r("app.media.ic_my_default_avatar"), '小锅1', '你好', 9, '2020-12-12', conversationType),
        new MessageConversationItemEntity($r("app.media.ic_my_default_avatar"), '小罗1', '你好', 9, '2020-12-12', conversationType),

      ]
    } else {
      return [
        new MessageConversationItemEntity($r("app.media.ic_my_default_avatar"), '小明的聊天群', '你好', 0, '2020-12-12', conversationType),
        new MessageConversationItemEntity($r("app.media.ic_my_default_avatar"), '小红的聊天群', '你好', 1, '2020-12-12', conversationType),
        new MessageConversationItemEntity($r("app.media.ic_my_default_avatar"), '小刚的聊天群', '你好', 1, '2020-12-12', conversationType),
        new MessageConversationItemEntity($r("app.media.ic_my_default_avatar"), '小李的聊天群', '你好', 999, '2020-12-12', conversationType),
        new MessageConversationItemEntity($r("app.media.ic_my_default_avatar"), '小张的聊天群', '你好', 1, '2020-12-12', conversationType),
        new MessageConversationItemEntity($r("app.media.ic_my_default_avatar"), '小王的聊天群', '你好', 1, '2020-12-12', conversationType),
        new MessageConversationItemEntity($r("app.media.ic_my_default_avatar"), '小赵的聊天群', '你好', 1, '2020-12-12', conversationType),
        new MessageConversationItemEntity($r("app.media.ic_my_default_avatar"), '小钱的聊天群', '你好', 1, '2020-12-12', conversationType),
        new MessageConversationItemEntity($r("app.media.ic_my_default_avatar"), '小孙的聊天群', '你好', 1, '2020-12-12', conversationType),
        new MessageConversationItemEntity($r("app.media.ic_my_default_avatar"), '小杨的聊天群', '你好', 1, '2020-12-12', conversationType),]
    }

  }
}