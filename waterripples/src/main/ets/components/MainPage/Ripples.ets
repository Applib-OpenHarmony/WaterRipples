/*
 * Copyright (C) 2022 Application Library Engineering Group
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
@Entry
@Component
export struct Ripples {
  @State index: number = 0
  @State pos: Point = { x: 200, y: 200 };
  @State pos1: Point = { x: 100, y: 100 };
  @State pos2: Point = { x: 100, y: 100 };
  @State pos3: Point = { x: 100, y: 100 };
  @State radius0: number = 0
  @State radius1: number = 0
  @State radius2: number = 0
  @State private model: Ripples.Model = undefined

  aboutToAppear() {
    if (this.model == null || this.model == undefined) return
  }

  private ripple() {
    if (this.index % 7 == 0) {
      this.pos1.x = this.pos.x
      this.pos1.y = this.pos.y
      animateTo({
        duration: 500,
        onFinish: () => {
          this.radius0 = 0
        }
      }, () => {
        this.radius0 = 7
      })
    }
    if (this.index % 7 == 1) {
      this.pos2.x = this.pos.x
      this.pos2.y = this.pos.y
      animateTo({
        duration: 500,
        onFinish: () => {
          this.radius1 = 0
        }
      }, () => {
        this.radius1 = 7
      })
    }
    if (this.index % 7 == 2) {
      this.pos3.x = this.pos.x
      this.pos3.y = this.pos.y
      animateTo({
        duration: 500,
        onFinish: () => {
          this.radius2 = 0
        }
      }, () => {
        this.radius2 = 7
      })
    }
  }

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Start, justifyContent: FlexAlign.SpaceBetween }) {
      Flex({ alignItems: ItemAlign.Center, justifyContent: FlexAlign.SpaceBetween }) {
        Circle({ width: '11vp', height: '11vp' })
          .position(this.pos1)
          .fillOpacity(0)
          .scale({ x: this.radius0, y: this.radius0 })
          .stroke(this.model.getCircleColor())
          .strokeWidth(1)
        Circle({ width: '11vp', height: '11vp' })
          .position(this.pos2)
          .fillOpacity(0)
          .scale({ x: this.radius1, y: this.radius1 })
          .stroke(this.model.getCircleColor())
          .strokeWidth(1)
        Circle({ width: '11vp', height: '11vp' })
          .position(this.pos3)
          .fillOpacity(0)
          .scale({ x: this.radius2, y: this.radius2 })
          .stroke(this.model.getCircleColor())
          .strokeWidth(1)
      }.backgroundColor(Color.Blue).width('100%')
    }
    .backgroundColor(this.model.getBackgroundColor())
    .height('100%')
    .onClick((event) => {
      this.pos.x = event.screenX;
      this.pos.y = event.screenY;
      animateTo({
        duration: 100,
        onFinish: () => {
        }
      }, () => {
      })
      this.index = this.index + 1
      this.ripple()
    })
    .onDragStart((event) => {
      this.pos.x = event.getX();
      this.pos.y = event.getY();
      animateTo({
        duration: 100,
        onFinish: () => {
        }
      }, () => {
      })
      this.index = this.index + 1
      this.ripple()
    })
    .onDragEnter((event) => {
      this.pos.x = event.getX();
      this.pos.y = event.getY();
      animateTo({
        duration: 100,
        onFinish: () => {
        }
      }, () => {
      })
      this.index = this.index + 1
      this.ripple()
    })
    .onDragMove((event) => {
      this.pos.x = event.getX();
      this.pos.y = event.getY();
      animateTo({
        duration: 100,
        onFinish: () => {
        }
      }, () => {
      })
      this.index = this.index + 1
      this.ripple()
    })
    .onDragLeave((event) => {
      this.pos.x = event.getX();
      this.pos.y = event.getY();
      animateTo({
        duration: 100,
        onFinish: () => {
        }
      }, () => {
      })
      this.index = this.index + 1
      this.ripple()
    })
    .onDrop((event) => {
      this.pos.x = event.getX();
      this.pos.y = event.getY();
      animateTo({
        duration: 100,
        onFinish: () => {
        }
      }, () => {
      })
      this.index = this.index + 1
      this.ripple()
    })
  }
}

export namespace Ripples {
  export class Model {
    private circleColor: ResourceColor | string = '#000000'
    private backgroundColor: ResourceColor | string = '#DCDCDC'

    getCircleColor(): ResourceColor | string {
      return this.circleColor
    }

    setCircleColor(circleColor: ResourceColor | string): Model {
      this.circleColor = (circleColor != null && circleColor != undefined) ? circleColor : '#000000';
      return this
    }

    getBackgroundColor(): ResourceColor | string {
      return this.backgroundColor
    }

    setBackgroundColor(backgroundColor: ResourceColor | string): Model {
      this.backgroundColor = (backgroundColor != null && backgroundColor != undefined) ? backgroundColor : '#000000';
      return this
    }
  }
}

class Point {
  x: number;
  y: number;
}