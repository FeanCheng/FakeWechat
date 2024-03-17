import { NinePictureWidget } from '../widget/friend/FriendNinePicturesWidget'
@Component
@Preview
export struct FriendsPostPage {


  @State haveNewPosts:number = 2
  @State postList:number[] = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]
  build() {

    this.buildPostList()
  }

  @Builder buildHaveNewPost(){
    Stack(){
      Row(){
        Image($r("app.media.ic_my_default_avatar"))
          .width(25)
          .height(25)
          .borderRadius(2)
          .margin({
            right:8
          })

        Text(`${this.haveNewPosts}条新消息`)
          .fontColor("#4FA075")
          .fontSize(13)
      }
      .height(35)
      .borderRadius(4)
      .backgroundColor(`#F5FAF7`)
      .margin({
        top:12,
        bottom:12
      })
      .padding({
        left:8,
        right:8
      })
    }
    .width("100%")
  }



  @Builder
  buildPostList(){
    List({
      space:10
    }){
      if (this.haveNewPosts){
        this.buildHaveNewPost()
      }
      ForEach(this.postList, (item,index:number)=>{
        ListItem(){
          Column({
            space:6
          }){
            this.buildPostItemHeader()
            this.buildPostItemContent(index)
          }.alignItems(HorizontalAlign.Start)
        }
      })
    }
    .margin({
      left:15,
      right:15
    })
    .layoutWeight(1)

  }


  @Builder
  buildPostItemHeader(){
    Row(){
      Image($r("app.media.ic_my_default_avatar"))
        .width(35)
        .height(35)
        .borderRadius(6)
      Column(){
        Text("张三")
          .fontSize(15)
          .fontColor("#333")
        Text("2019-12-12")
          .fontSize(12)
          .fontColor("#999")
      }.alignItems(HorizontalAlign.Start)
      .margin({
        left:15
      })
    }
  }

  @Builder
  buildPostItemContent(index:number){
    Column(){
      NinePictureWidget({
        pictures:this.getPostPictures(index)
      })
      Text("在苦苦挣扎中，如果有人向你投以理解的目光，你会感到一种生命的暖意，或许仅有短暂的一瞥，就足以使我感奋不已。")
        .fontSize(15)
        .fontColor("#222325")
        .margin({
          top:10
        })
    }
  }
  getPostPictures(index:number){
    let avatars:ResourceStr[] = []
    if (index <=0) {
      avatars.push($r("app.media.ic_my_default_avatar"))
    }else {
      let count = Math.min(index,9)
      for (let index = 0; index < count; index++) {
        avatars.push($r("app.media.ic_my_default_avatar"))
      }
    }
    return avatars
  }
}