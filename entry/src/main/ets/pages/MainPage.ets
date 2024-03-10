import promptAction from '@ohos.promptAction'
import { MainPageBottomTabEntity } from '../entity/MainPageBottomTabEntity'
import { MessagePage } from './message/MessagePage'
import { MinePage } from './mine/MinePage'

@Entry
@Component
struct MainPage {
  bottomTabs: MainPageBottomTabEntity[] = [
    new MainPageBottomTabEntity("微信", $r("app.media.ic_message_default"), $r("app.media.ic_message_select"), ""),
    new MainPageBottomTabEntity("通讯录", $r("app.media.ic_contact_default"), $r("app.media.ic_contact_select"), ""),
    new MainPageBottomTabEntity("发现", $r("app.media.ic_friend_default"), $r("app.media.ic_friend_select"), ""),
    new MainPageBottomTabEntity("我", $r("app.media.ic_mine_default"), $r("app.media.ic_mine_select"), "")
  ]

  /**
   * 当前选中的下标
   */
  @State chooseIndex: number = 0

  build() {
    Tabs({ barPosition: BarPosition.End }) {
      ForEach(this.bottomTabs, (item: MainPageBottomTabEntity, index: number) => {
        TabContent() {
          if (index === 0){
            MessagePage()
          }else if (index === 3) {
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
    .barHeight(49)

    .onChange((index) => {
      this.chooseIndex = index
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
        .width(30)
        .height(30)
    }
    .padding({
      top:9.5
    })
    .width("100%")
    .height(49)
    .backgroundColor("#F5FAF7")
  }
}
