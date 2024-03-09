import Prompt from '@system.prompt'
import promptAction from '@ohos.promptAction'
import { MineFunctionItemEntity } from '../../entity/MineFunctionItemEntity'

@Component
@Preview
export struct MineFunctionPanelWidget {
  /**
   * 功能块列表
   */
  @State functions: MineFunctionItemEntity[] = MineFunctionItemEntity.defaultFunctions()
  scroll = new Scroller()

  build() {

    Grid(this.scroll) {
      ForEach(this.functions, (item: MineFunctionItemEntity, index: number) => {
        GridItem() {
          this.functionItem(item)
        }
      })
    }
    .width("100%")
    .cellLength(90)
    .maxCount(4)
    .margin({
      top:10,
      bottom:10
    })
  }

  @Builder functionItem(item: MineFunctionItemEntity) {
    Column() {
      Image(item.icon)
        .margin({
          top:12
        })
        .width(40)
        .height(40)
      Text(item.name)
        .fontSize(13)
        .fontColor($r("app.color.Color222323"))
        .margin({
          top:12
        })
    }
    .width("25%")
    .onClick(()=>{
      console.log(`点击了 ${item.name}` )
      promptAction.showToast({
        message: `你点击的是${item.name}`
      })
    })
  }
}