import { ContactsMockData } from '../../constant/ContactsMockData'
import { ContactsUserGroupItemEntity } from '../../entity/ContactsUserGroupItemEntity'
import { ContactsUserItemEntity } from '../../entity/ContactsUserItemEntity'
@Preview
@Component
export struct ContactsPage {

  @State pinyinList:string[] = ContactsMockData.pinyinList()

  build() {
    Column() {
      this.buildSearchFriend()
      this.buildTopFunctionPanel()
      this.buildContents()
    }
    .height("100%")
    .width("100%")
  }


  /**
   * 搜索好友
   */
  @Builder buildSearchFriend() {
    Stack({
      alignContent:Alignment.Start
    }) {
      Image($r("app.media.ic_contacts_search"))
        .width(16)
        .margin({
          left:20
        })
        .alignSelf(ItemAlign.Center)

      Text("搜索好友")
        .fontSize(15)
        .fontColor("#C0C0C1")
        .textAlign(TextAlign.Center)
        .alignSelf(ItemAlign.Center)
        .align(Alignment.Center)
        .width("100%")
    }
    .width("90%")
    .borderRadius(23)
    .backgroundColor("#F8FAFB")
    .height(46)
    .margin({
      top:8
    })
  }


  /**
   * 顶部功能栏
   */
  @Builder buildTopFunctionPanel(){

    Row(){

      Column(){
        Image($r("app.media.ic_contacts_add_friend")).width(40).height(40)
        Text("添加好友").fontSize(14).fontColor("#222325")
      }
        .height("100%")
        .layoutWeight(1)
      Column(){
        Image($r("app.media.ic_contacts_group_chat")).width(40).height(40)
        Text("群聊").fontSize(14).fontColor("#222325")
      }
      .height("100%")
      .layoutWeight(1)
      Column(){
        Image($r("app.media.ic_contacts_labels")).width(40).height(40)
        Text("标签").fontSize(14).fontColor("#222325")
      }
      .height("100%")
      .layoutWeight(1)
      Column(){
        Image($r("app.media.ic_contacts_subsctions")).width(40).height(40)
        Text("公众号").fontSize(14).fontColor("#222325")
      }
      .height("100%")
      .layoutWeight(1)
    }
    .width("100%")
    .height(89)
    .margin({
      top:6
    })
  }

  @Builder buildContents() {
    Row(){

      List(){
        ForEach(ContactsMockData.mockContactsGroupsList(), (group:ContactsUserGroupItemEntity) => {
          ListItemGroup({
            header: this.buildGroupHeader(group.groupTitle)
          }){
            ForEach(group.userList, (contact:ContactsUserItemEntity) => {
              ListItem(){
                Text(contact.nickName)
                  .height(40)
              }
            })
          }
        })


      }.height("100%").layoutWeight(1)
      .sticky(StickyStyle.Header)


      AlphabetIndexer({
        arrayValue:this.pinyinList,
        selected:0
      }).height("100%")

    }
    .height("100%")
    .width("100%")
  }
  @Builder buildGroupHeader(group: string) {
    Text(group)
      .fontSize(14)
      .fontColor("#969698")
      .height(50)
      .width("100%")
      .margin({
        left: 20
      })
      .backgroundColor(Color.Blue)
  }

  @Builder buildContactsItemCard(){

  }
}