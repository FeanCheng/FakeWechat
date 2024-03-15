import promptAction from '@ohos.promptAction'
import display from '@ohos.display'
import { MineFunctionPanelWidget } from '../../widget/mine/MineFunctionPanelWidget'

@Preview
@Component
export struct MinePage {

  // @State userAvatar:string = "app.media.app_icon"
  /**
   * 用户昵称
   */
  @State nickName: string = "阿锅"
  /**
   * 微信号
   */
  @State wechatId: string = "aqiyeeee"

  /**
   * 地区
   */
  @State region: string = "中国"

  /**
   * 用户最新的朋友圈图片
   */
  @State lastNewPictures:ResourceStr[] = []

  /**
   * 当前是否是显示二维码
   */
  @State isShowQrCode:boolean = false


  aboutToAppear(){
    //初始化头像数据
    for (let i = 0; i < 10; i++) {
      this.lastNewPictures.push($r("app.media.ic_my_default_avatar"))
    }
  }


  build() {
    Stack(){
      Scroll(){
        Column() {
          this.headerContainer()
          this.userStatusContainer()
          MineFunctionPanelWidget()
          Divider()
            .color($r("app.color.ColorF5FAF7"))
            .strokeWidth(8)
          this.userCollection()
          this.userFriendCircle()
          this.userFriendNewPictures()

        }
      }
      .edgeEffect(EdgeEffect.Spring)
      .scrollBar(BarState.Off)
      .width("100%")
      .height("100%")

      if (this.isShowQrCode){
        this.buildQrCodePanel()
      }

    }   .width("100%")
    .height("100%")

  }

  @Builder
  //头部控件
  headerContainer() {
    RelativeContainer() {
      //头像
      Image($r("app.media.ic_my_default_avatar"))
        .height(70)
        .width(70)
        .borderRadius(8)
        .id("userAvatar")
        .margin({
          top: 25,
          left: 25
        })
        .alignRules({
          top: { anchor: "__container__", align: VerticalAlign.Top },
          left: { anchor: "__container__", align: HorizontalAlign.Start }
        })
      // 昵称
      Text("阿锅")
        .fontSize(18)
        .fontColor(Color.Black)
        .fontWeight(FontWeight.Bold)
        .id("userNickName")
        .margin({
          top: 35,
          left: 15
        })
        .constraintSize({
          maxWidth: 125
        })
        .alignRules({
          top: { anchor: "userAvatar", align: VerticalAlign.Top },
          left: { anchor: "userAvatar", align: HorizontalAlign.End }
        })
      Text(`微信号：${this.wechatId}`)
        .fontSize(12)
        .fontColor($r("app.color.Color969698"))
        .id("wechatId")
        .alignRules({
          bottom: { anchor: "userAvatar", align: VerticalAlign.Bottom },
          left: { anchor: "userNickName", align: HorizontalAlign.Start }
        })
        .margin({
          left: 15,
          bottom: 10
        })

      Image($r("app.media.ic_qr_code"))
        .height(35)
        .width(35)
        .id("mineQrCode")
        .alignRules({
          top: { anchor: "mineSetting", align: VerticalAlign.Top },
          right: { anchor: "mineSetting", align: HorizontalAlign.Start }
        })
        .margin({
          right: 10,
          top: 30
        })
        .onClick(()=>{
          this.isShowQrCode = true
        })
      //设置
      Image($r("app.media.ic_setting"))
        .height(35)
        .width(35)
        .id("mineSetting")
        .alignRules({
          top: { anchor: "__container__", align: VerticalAlign.Top },
          right: { anchor: "__container__", align: HorizontalAlign.End }
        })
        .margin({
          right: 25,
          top: 30
        })
    }
    .height(110)
    .width("100%")
  }

  /**
   * 用户状态
   */
  @Builder
  userStatusContainer() {
    Row(){
      Image($r("app.media.ic_smile"))
        .width(24)
        .height(24)
        .margin({
          left: 15
        })
      Text("美滋滋")
        .fontSize(14)
        .fontColor($r("app.color.Color1A1A1B"))
        .fontWeight(FontWeight.Bold)
        .margin({
          left: 4
        })
      Text("|")
        .fontSize(14)
        .fontColor("#D8D8D8")
        .fontWeight(FontWeight.Bold)
        .margin({
          left: 10,
          right:10
        })

      Text("25个好友也在美滋滋")
        .fontSize(12)
        .fontColor($r("app.color.Color1A1A1B"))
        .fontWeight(FontWeight.Bold)

      Blank()

      Image($r("app.media.ic_arrow_bottom"))
        .width(14)
        .margin({
          right:18
        })
    }
      .alignItems(VerticalAlign.Center)
      .height(44)
      .width("90%")
      .borderRadius(22)
      .backgroundColor($r("app.color.ColorF5FAF7"))
  }

  /**
   * 用户收藏
   */
  @Builder
  userCollection(){
    Row(){
      Text("收藏")
        .fontSize(16)
        .fontColor($r("app.color.Color1A1A1B"))
        .fontWeight(FontWeight.Medium)
      Blank()
      Image($r("app.media.ic_arrow_bottom"))
        .width(14)
        .rotate({
          angle:-90
        })
    }
    .padding({
      left:20,
      right:20
    })
    .width("100%")
    .height(55)
  }



  /**
   * 用户朋友圈
   */
  @Builder
  userFriendCircle(){
    Row(){
      Text("朋友圈")
        .fontSize(16)
        .fontColor($r("app.color.Color1A1A1B"))
        .fontWeight(FontWeight.Medium)
      Blank()
      Text("64")
        .fontSize(16)
        .fontColor($r("app.color.Color1A1A1B"))
        .fontWeight(FontWeight.Medium)
      Image($r("app.media.ic_arrow_bottom"))
        .width(14)
        .rotate({
          angle:-90
        })
    }
    .padding({
      left:20,
      right:20
    })
    .width("100%")
    .height(55)
  }

  /**
   * 用户朋友圈最新的10张图片
   */

  @Builder
  userFriendNewPictures(){
    List({
      space:10,
      initialIndex:0
    }){
      ForEach(this.lastNewPictures,(item:ResourceStr, index:number)=>{
        ListItem(){
          Image(item)
            .height(115)
            .width("26%")
            .borderRadius(6)
        }
      })
    }
    .margin({
      left:20
    })

    .listDirection(Axis.Horizontal)
  }


  @Builder buildQrCodePanel(){

    Panel(true) {
      Column() {
        Image($r("app.media.ic_common_back"))
          .width(30)
          .height(30)
          .rotate({
            angle:-90
          })
          .alignSelf(ItemAlign.End)
          .onClick(()=>{
            this.isShowQrCode = false
          }).margin({
          right:20
        })

        Image($r("app.media.ic_my_default_avatar"))
          .borderRadius(37)
          .height(75)
          .margin({
            top: 20
          })
          .width(75)

        Text("阿锅")
          .fontSize(19)
          .margin({
            top: 12
          })
          .fontColor("#21252A")

        Text("中国·厦门")
          .fontSize(15)
          .margin({
            top: 6
          })
          .fontColor("#BCBDBD")

        Image($r("app.media.ic_mine_my_qr_code"))
          .height(200)
          .margin({
            top: 25
          })
          .width(200)

        Text("扫一扫上面的二维码图案，加我微信")
          .fontSize(13)
          .margin({
            top: 30
          })
          .fontColor("#222325")

      }.height("100%")
      .width("100%")
    }
    .halfHeight(600)
    .backgroundMask("#99656567")
    .backgroundColor(Color.White)
  }
}