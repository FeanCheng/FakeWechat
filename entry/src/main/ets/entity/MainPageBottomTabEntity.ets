/**
 * 首页底部菜单tab实体
 */
export class MainPageBottomTabEntity {
  private _title: string
  private _defaultIcon: ResourceStr
  private _activityIcon: ResourceStr
  private _pageRouter: string

  constructor(title: string, defaultIcon: ResourceStr, activityIcon: ResourceStr, pageRouter: string) {
    this._title = title;
    this._defaultIcon = defaultIcon;
    this._activityIcon = activityIcon;
    this._pageRouter = pageRouter;
  }


  /**
   * 返回title
   */
  get title(): string {
    return this._title;
  }

  /**
   * 返回图标
   * @param isCheck
   * @returns
   */
  getIcon(isCheck: boolean): ResourceStr {
    return isCheck ? this._activityIcon : this._defaultIcon
  }
  /**
   * 返回页面路由路径
   * @returns
   */
  get pageRouter(): string {
    return this._pageRouter;
  }
}