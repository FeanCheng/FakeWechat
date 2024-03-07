import promptAction from '@ohos.promptAction'
@Preview
@Component
export struct MinePage{

  // @State userAvatar:string = "app.media.app_icon"

  build(){

    Column(){
      this.headerContainer()
    }
    .width("100%")
    .height("100%")

  }


  @Builder
  //头部控件
  headerContainer(){
    RelativeContainer(){

      //头像
      Image($r("app.media.app_icon"))
        .height(60)
        .width(60)
        .borderRadius(4)
        .id("userAvatar")
        .margin({
          top:'10%',
          left:'5%'
        })
        .alignRules({
          top:{ anchor:"__container__",align:VerticalAlign.Top },
          left:{ anchor:"__container__",align:HorizontalAlign.Start}
        }).backgroundColor("#36d")

      Text("阿锅")
        .fontSize(20)
        .fontColor(Color.Black)
        .fontWeight(FontWeight.Bold)
        .id("userNickName")
        .margin({
          left:12
        })
        .alignRules({
          top:{ anchor:"userAvatar",align:VerticalAlign.Top },
          left:{ anchor:"userAvatar",align:HorizontalAlign.End}
        })

    }
    .height(200)
    .width("100%")
    .backgroundColor("#f5f5f5")
  }


  onPageShow(){
    console.log("MinePage show")
  }
  onPageHide(){
    console.log("MinePage hide")
  }

  aboutToAppear(){
    console.log("MinePage aboutToAppear")
  }
  aboutToDisappear(){
    console.log("MinePage aboutToDisappear")
  }
}