import { MainPageBottomTabEntity } from '../entity/MainPageBottomTabEntity'

@Entry
@Component
struct MainPage {
  bottomTabs: MainPageBottomTabEntity[] = [
    new MainPageBottomTabEntity("微信", $r("app.media.app_icon"), $r("app.media.app_icon"), ""),
    new MainPageBottomTabEntity("通讯录", $r("app.media.app_icon"), $r("app.media.app_icon"), ""),
    new MainPageBottomTabEntity("发现", $r("app.media.app_icon"), $r("app.media.app_icon"), ""),
    new MainPageBottomTabEntity("我", $r("app.media.app_icon"), $r("app.media.app_icon"), "")
  ]
  /**
   * 当前选中的下标
   */
  @State chooseIndex: number = 0

  build() {

    Tabs({
      barPosition: BarPosition.End,
    }) {
      ForEach(this.bottomTabs,(item:MainPageBottomTabEntity,index:number)=>{
        TabContent().tabBar(this.navigationBottomTabItem(item,index))
      })
    }
    .scrollable(false)
    .width("100%")
    .height("100%")

  }

  /**
   * 底部菜单栏组件
   * @param item
   */
  @Builder
  navigationBottomTabItem(item: MainPageBottomTabEntity, index: number) {
    Column({ space: 5 }) {
      Image(item.getIcon(this.chooseIndex === index))
        .width(24)
        .height(24)
      Text(item.title)
        .fontSize(12)
    }
    .layoutWeight(1)
    .onClick(() => {
      this.chooseIndex = index
    })
  }
}
