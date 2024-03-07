import promptAction from '@ohos.promptAction'
import { MainPageBottomTabEntity } from '../entity/MainPageBottomTabEntity'
import { MinePage } from './mine/MinePage'

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
    Tabs({ barPosition: BarPosition.End }) {

      ForEach(this.bottomTabs, (item: MainPageBottomTabEntity, index: number) => {
        TabContent() {
          if (index === 3) {
            MinePage()
          } else {
            Text("这是第" + index + "个页面")
          }
        }
        .tabBar(this.navigationBottomTabItem(item, index))
        .tabIndex(index)
      })
    }
    .scrollable(false)
    .width("100%")
    .height("100%")
    .onChange((index) => {
      this.chooseIndex = index
      console.log(`index =${index}`)
    })
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
        .fontColor(
          this.chooseIndex === index ? $r('app.color.Color56BA68') : Color.Black
        )
    }.width("100%")
  }
}
