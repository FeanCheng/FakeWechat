import promptAction from '@ohos.promptAction'
import { MainPageBottomTabEntity } from '../entity/MainPageBottomTabEntity'
import { ContactsPage } from './contacts/ContactsPage'
import { FriendsPostPage } from './FriendsPostPage'
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
      TabContent() {
        MessagePage()
      }
      .tabBar(this.navigationBottomTabItem(this.bottomTabs[0], 0))
      .tabIndex(0)

      TabContent() {
        ContactsPage()

      }
      .tabBar(this.navigationBottomTabItem(this.bottomTabs[1], 1))
      .tabIndex(1)

      TabContent() {
        FriendsPostPage()
      }
      .tabBar(this.navigationBottomTabItem(this.bottomTabs[2], 2))
      .tabIndex(2)

      TabContent() {
        MinePage()
      }
      .tabBar(this.navigationBottomTabItem(this.bottomTabs[3], 3))
      .tabIndex(3)
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
      top: 9.5
    })
    .width("100%")
    .height(49)
    .backgroundColor("#F5FAF7")
  }
}
