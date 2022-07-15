# Water Ripples
一Water ripple animation library for OpenHarmony
## Adding Dependencies
Add the following dependency in entry/package.json

```
"dependencies": {
    "@ohos/waterripples": "file:../waterripples"
  }
```
## Usage Instructions

### -Ripples

These are used to create water ripple animation

```
import { Ripples } from '@ohos/waterripples'

@Entry
@Component
struct Index {
  private ripple: Ripples.Model = new Ripples.Model()

  aboutToAppear() {
    this.ripple.setBackgroundColor(Color.Black).setCircleColor(Color.White)
  }

  build() {
    Column() {
      Flex({ justifyContent: FlexAlign.Start }) {
        Ripples({
          model: this.ripple }
        )
      }
      .width('100%')
    }
  }
}
```
## Demo
![Animation.png](Images/Animation1.gif)
## Compatibility
Supports OpenHarmony API version 8 and above
## Directory
```
|---- WaterRipple
|     |---- entry  # sample app usage
|     |---- waterripples  # Animation library
|           |----src 
|             |----main 
|               |----ets
|                   |----components
|                       |----MainPage
|                           |---- Ripples.ets  # Water Ripple animation
|     |---- README.MD  # installation and usage
```
## Code Contribution
If you find any problems during usage, you can submit an [Issue](https://github.com/Applib-OpenHarmony/WaterRipples/issues) to us. Of course, we also welcome you to send us [PR](https://github.com/enigmij/WaterRipples/pulls).

## Open source License
This project is based on [Apache License 2.0](https://github.com/applibgroup/applibgroup/blob/main/LICENSE), please enjoy and participate in open source freely.
