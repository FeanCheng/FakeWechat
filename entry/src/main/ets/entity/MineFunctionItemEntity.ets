
/**
 * 我的模块-功能面板实体
 */
export class MineFunctionItemEntity {
  private _icon: ResourceStr
  private _name: string

  constructor(icon: ResourceStr, name: string) {
    this._icon = icon;
    this._name = name;
  }

  get icon(): ResourceStr {
    return this._icon;
  }

  get name(): string {
    return this._name;
  }



  /**
   *
   * @returns 返回默认的功能板块数据
   */
  static defaultFunctions(): Array<MineFunctionItemEntity> {
    return [
      new MineFunctionItemEntity($r("app.media.ic_mine_function_payment"),"支付"),
      new MineFunctionItemEntity($r("app.media.ic_mine_function_wallet"),"钱包"),
      new MineFunctionItemEntity($r("app.media.ic_mine_function_card_pkg"),"卡包"),
      new MineFunctionItemEntity($r("app.media.ic_mine_function_shopping"),"购物"),
      new MineFunctionItemEntity($r("app.media.ic_mine_function_sports"),"运动"),
      new MineFunctionItemEntity($r("app.media.ic_mine_function_game"),"游戏"),
      new MineFunctionItemEntity($r("app.media.ic_mine_function_minipro"),"小程序"),
      new MineFunctionItemEntity($r("app.media.ic_mine_function_search"),"搜一搜"),
      new MineFunctionItemEntity($r("app.media.ic_mine_function_look"),"看一看"),
      new MineFunctionItemEntity($r("app.media.ic_mine_function_listener"),"听一听"),
      new MineFunctionItemEntity($r("app.media.ic_mine_function_shake"),"摇一摇"),
      new MineFunctionItemEntity($r("app.media.ic_mine_function_more"),"更多")
    ]
  }
}