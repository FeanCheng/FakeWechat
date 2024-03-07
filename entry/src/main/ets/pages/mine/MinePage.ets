import promptAction from '@ohos.promptAction'
@Component
export struct MinePage{
  @State count:number = 0
  build(){
    Text(`MinePage count=${this.count}`).onClick(()=>{
      this.count ++
    })

  }
  onPageShow(){
    console.log("MinePage show")
  }
  onPageHide(){
    console.log("MinePage hide")
  }

  aboutToAppear(){
    console.log("MinePage aboutToAppear")
    promptAction.showToast({
      message:"MinePage aboutToAppear"
    })
  }
  aboutToDisappear(){
    console.log("MinePage aboutToDisappear")
  }
}