@Component
@Preview
export struct NinePictureWidget {

  /**
   * 图片数组
   */
  pictures: Array<ResourceStr>
  private itemWidth: number | string
  private itemHeight: number | string
  private itemMargin: number | string

  build() {

    Flex({
      direction: FlexDirection.Row,
      wrap: FlexWrap.Wrap,

    }) {
      ForEach(this.pictures, (item: ResourceStr, index) => {
        Image(item)
          .width(this.itemWidth)
          .height(this.itemHeight)
          .margin(this.itemMargin)
          .borderRadius(6)
      })
    }

  }

  aboutToAppear() {
    if (!this.pictures) {
      return
    }
    let count = this.pictures.length
    let line = Math.ceil(count / 3)
    switch (count) {
      case 1:
        this.itemWidth = 210
        this.itemHeight = 210
        this.itemMargin = 0
        break
      case 2:
        this.itemMargin = "1%"
        this.itemWidth = "48%"
        this.itemHeight = 169
        break
      case 4:
        this.itemMargin = "1%"
        this.itemWidth = "48%"
        this.itemHeight = 100
        break
      default:
        this.itemMargin = "1%"
        this.itemWidth = `${(100-6)/3}%`
        this.itemHeight = 100
    }
  }
}