import { MessageSubscriptionCardGroupEntity } from '../../entity/MessageSubscriptionCardGroupEntity'
import { MessageSubscriptionCardItem } from '../../entity/MessageSubscriptionCardItemEntity'
import { MessageUsualnessSubscriptionEntity } from '../../entity/MessageUsualnessSubscriptionEntity'

@Component
@Preview
export struct MessageSubscriptionPage {
  @State subscriptionList: Array<MessageUsualnessSubscriptionEntity> = MessageUsualnessSubscriptionEntity.defaultData()
  @State subscriptionCardList: Array<MessageSubscriptionCardGroupEntity> = MessageSubscriptionCardGroupEntity.defaultData()

  build() {
    Column() {

      this.buildSubscriptionCardList()
    }

    .width("100%")
    .height("100%")
  }


  /**
   * 常读订阅号
   */
  @Builder buildUsualnessSubscription() {

    Text("常读订阅号")
      .fontSize(14)
      .fontColor("#969698")
      .height(35)
      .width("100%")
      .textAlign(TextAlign.Start)
    .margin({
      left:20
    })

    List({ space: 30 }) {
      ForEach(this.subscriptionList, (item: MessageUsualnessSubscriptionEntity) => {
        ListItem() {
          this.buildUsualnessSubscriptionItem(item)
        }
      })
    }
    .margin({
      left: 20,
      right: 20
    })
    .listDirection(Axis.Horizontal)
    .alignListItem(ListItemAlign.Center)
    .width("100%")
    .height(60)
  }

  /**
   * 订阅号列表
   * @param item
   */
  @Builder buildUsualnessSubscriptionItem(item: MessageUsualnessSubscriptionEntity) {
    Stack() {
      Image(item.avatar)
        .width("100%")
        .height("100%")
        .borderRadius(30)

      if (item.hasNewMessage) {
        Circle()
          .width(9)
          .height(9)
          .fill("#4FA075")
          .stroke(Color.White)
          .strokeWidth(1)
          .position({
            x: 34,
            y: 34
          })
      }
    }.width(45).height(45)
  }

  @Builder buildSubscriptionCardList() {
    List() {
      if (this.subscriptionList.length > 0) {
        this.buildUsualnessSubscription()
      }
      ForEach(this.subscriptionCardList, (item: MessageSubscriptionCardGroupEntity) => {
        ListItemGroup({
          header: this.buildSubscriptionCardGroupHeader(item.groupTitle)
        }) {
          ForEach(item.groupList, (cardItem: MessageSubscriptionCardItem) => {
            ListItem() {
              this.buildSubscriptionCardItem(cardItem)
            }
          })
        }
      })
    }
    .width("100%")
    .height("100%")
    .sticky(StickyStyle.Header)
  }

  @Builder buildSubscriptionCardGroupHeader(group: string) {
    Text(group)
      .fontSize(14)
      .fontColor("#969698")
      .height(35)
      .width("100%")
      .margin({
        left: 20
      })
      .backgroundColor(Color.White)
  }


  /**
   * 订阅号的消息卡片
   */
  @Builder buildSubscriptionCardItem(cardItem: MessageSubscriptionCardItem) {
    Column() {
      Row() {
        Image(cardItem.userAvatar)
          .width(30)
          .height(30)
          .borderRadius(15)
        Text(cardItem.userName)
          .fontSize(17)
          .fontColor("#2f2f2f")
          .textAlign(TextAlign.Start)
          .margin({
            left: 8
          })
        Blank()
        Text(cardItem.publishTime)
          .fontSize(13)
          .fontColor("#999999")
          .textAlign(TextAlign.Start)
      }.height(40)
      .width("100%")

      Image(cardItem.cover)
        .width("100%")
        .height(175)
        .borderRadius(10)
        .margin({
          top: 5
        })

      Text(cardItem.title)
        .fontColor(Color.Black)
        .fontSize(16)
        .width("100%")
        .margin({
          top: 15
        })

      Text(cardItem.subTitle)
        .fontColor("#7F7F7F")
        .fontSize(14)
        .width("100%")
        .margin({
          top: 6
        })

      Row() {
        Image($r("app.media.ic_mine_function_look"))
          .width(22)
          .margin({
            right: 6
          })
        Text(`${cardItem.lookCount}位朋友看过`)
          .fontColor("#222325")
          .fontSize(14)
        Blank()
        Text("查看全文")
          .fontColor("#222325")
          .fontSize(14)
      }
      .alignItems(VerticalAlign.Center)
      .height(40)
      .width("100%")
    }.width("100%")
    .padding({
      left: 20,
      right: 20
    })
  }
}