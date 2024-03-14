import { ContactsMockData } from '../../constant/ContactsMockData'
import { ContactsUserGroupItemEntity } from '../../entity/ContactsUserGroupItemEntity'
import { ContactsUserItemEntity } from '../../entity/ContactsUserItemEntity'
@Preview
@Component
export struct ContactsPage {

  @State pinyinList:string[] = ContactsMockData.pinyinList()

  @State selectedGroupIndex:number = 0

  @State contactsList:ContactsUserGroupItemEntity[] = ContactsMockData.mockContactsGroupsList()

  private contactsScroll = new Scroller()

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
      top:30
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

      List({initialIndex:this.selectedGroupIndex,scroller:this.contactsScroll}){
        ForEach(this.contactsList, (group:ContactsUserGroupItemEntity) => {
          ListItemGroup({
            header: this.buildGroupHeader(group.groupTitle)
          }){
            ForEach(group.userList, (contact:ContactsUserItemEntity) => {
              ListItem(){
                this.buildContactsItemCard(contact)
              }
            })
          }
        })
      }
      .onScrollIndex((start,end:number)=>{
        this.selectedGroupIndex = end
      })
      .height("100%")
      .margin({
        left:20
      })
      .layoutWeight(1)
      .sticky(StickyStyle.Header)


      AlphabetIndexer({
        arrayValue: this.pinyinList,
        selected: this.selectedGroupIndex
      }).height("70%")
        .onSelect((index: number) => {
          this.selectedGroupIndex = index
          this.contactsScroll.scrollToIndex(this.selectedGroupIndex)
        })
    }
    .alignItems(VerticalAlign.Top)
    .height("100%")
    .width("100%")
  }
  @Builder buildGroupHeader(group: string) {
    Text(group)
      .fontSize(14)
      .fontColor("#4FA075")
      .height(30)
      .width("100%")
      .backgroundColor(Color.White)
  }

  @Builder buildContactsItemCard(item:ContactsUserItemEntity){
    Row(){
      Image(item.avatar)
        .width(48)
        .height(48)
      Column({
        space:6
      }){
        Text(item.nickName).fontSize(16).fontColor("#2F2F2F")
        Text(item.desc).fontSize(14).fontColor("#A4AAB3")
      }.margin({
        left:20,
        right:20
      })
      .alignItems(HorizontalAlign.Start)
    }
    .height(48)
    .margin({
      top:10,
      bottom:10
    })
  }
}