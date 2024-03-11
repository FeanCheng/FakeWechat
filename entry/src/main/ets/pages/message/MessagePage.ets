import { MessageConversationType } from '../../MessageConversationType'
import { MessageConversationPage } from './MessageConversationPage'
import { MessageSubscriptionPage } from './MessageSubscriptionPage'

@Component
@Preview
@Entry
export struct MessagePage {
  @State totalMessageUnreadCount: number = 666

  /**
   * 是否是电脑在线
   */
  @State isPcOnline: boolean = true
  @State tabs: string[] = ['好友', '群组', '公众号']

  /**
   * 选中下标
   */
  @State chooseIndex: number = 0

  build() {
    Column() {
      this.buildPageTitle()
      this.buildTabs()
      this.buildContentByTabIndex()
    }.width("100%")
    .height("100%")
  }

  @Builder buildPageTitle() {
    Row() {
      Text(`微信（${this.totalMessageUnreadCount}）`)
        .fontWeight(FontWeight.Medium)
        .fontSize(20)
      Blank()
      Image($r("app.media.ic_message_search"))
        .height(30)
        .width(30)
        .margin({
          right: 8
        })
      Image($r("app.media.ic_message_add"))
        .height(30)
        .width(30)
    }
    .width("100%")
    .height(55)
    .padding({
      left: 20,
      right: 12,
      top:22
    })
  }

  @Builder buildTabs() {
    Row() {
      ForEach(this.tabs, (title: string, index) => {
        this.buildTabsBar(title, index)
      })
      if (this.isPcOnline) {
        Blank()
        Image($r("app.media.ic_message_pc_online"))
          .width(30)
          .height(30)
      }
    }
    .padding({
      right: 20,
      left: 10
    })
    .width("100%")
    .height(45)
  }

  @Builder buildTabsBar(title: string, index: number) {
    Column() {
      Text(title)
        .fontSize(16)
        .fontColor(this.chooseIndex === index ? "#262628" : "#A3A3A4")
        .margin({
          top: 11,
          left: 10,
          right: 10
        })
      Blank()
      Divider()
        .width(10)
        .strokeWidth(2)
        .color('#4FA075')
        .opacity(this.chooseIndex === index ? 1 : 0)
    }
    .height("100%")
    .onClick(() => {
      this.chooseIndex = index
    })
  }

  @Builder buildContentByTabIndex() {
    Stack() {
      MessageConversationPage({
        conversationType: MessageConversationType.PRIVATE
      })
        .visibility(this.chooseIndex === 0 ? Visibility.Visible : Visibility.None)
      MessageConversationPage({
        conversationType: MessageConversationType.GROUP
      })
        .visibility(this.chooseIndex === 1 ? Visibility.Visible : Visibility.None)

      MessageSubscriptionPage()
        .visibility(this.chooseIndex === 2 ? Visibility.Visible : Visibility.None)

    }
    .layoutWeight(1)
    .margin({
      top: 10
    })
  }

  @Styles fullScreen() {
    .width("100%")
    .height("100%")
  }
}