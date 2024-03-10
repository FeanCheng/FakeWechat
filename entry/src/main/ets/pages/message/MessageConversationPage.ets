import display from '@ohos.display';
import { MessageConversationItemEntity } from '../../entity/MessageConversationItemEntity';
import { MessageConversationType } from '../../MessageConversationType';

@Component
@Preview
export struct MessageConversationPage {
  conversationType: MessageConversationType
  @State conversations: MessageConversationItemEntity[] = []
  listScroll = new Scroller()

  aboutToAppear() {
    console.log(`MessageConversationPage = ${this.conversationType} aboutToAppear`)
    this.conversations = MessageConversationItemEntity.defaultConversations(this.conversationType)
  }

  build() {
    List({ space: 10, scroller: this.listScroll }) {
      ForEach(this.conversations, (item: MessageConversationItemEntity) => {
        ListItem() {
          this.buildConversationItem(item)
        }
      })
    }.edgeEffect(EdgeEffect.Spring)
  }

  @Builder buildConversationItem(item: MessageConversationItemEntity) {
    Row() {
      Image(item.avatar)
        .width(60)
        .height(60)
        .borderRadius(8)
        .margin({
          left: 20,
          right: 18
        })

      Column() {
        Row() {
          Text(item.nickName)
            .fontSize(16)
          Blank().layoutWeight(1)
          Text(item.time)
            .fontSize(13)
            .fontColor("#A3A3A4")
        }

        .width("100%")
        .justifyContent(FlexAlign.Start)

        Row() {
          Text(item.desc)
            .fontSize(14)
            .fontColor("#A3A3A4")
          if (item.unreadCount > 0) {
            Text(`${item.unreadCount > 99 ? "99+" : item.unreadCount}`)
              .fontSize(13)
              .fontColor(Color.White)
              .borderRadius(20)
              .backgroundColor("#FF5656")
              .padding({
                left: 4,
                right: 4
              })
          }

        }
        .margin({
          top: 7
        })
        .width("100%")

        .justifyContent(FlexAlign.SpaceBetween)
      }
      .layoutWeight(1)
      .margin({
        right: 20
      })
    }
    .width("100%")
  }
}