// import { Controller } from "@hotwired/stimulus"

// export default class extends Controller {
//   static targets = [ 'right', 'left' ]

//   connect() {
//     if (this.hasRightTarget && this.hasLeftTarget) {
//       this.initScrollWithButtons()
//     }
//     this.threshold = 4
//   }

//   scroll(e) {
//     this.element.scrollLeft += e.deltaY;
//   }

//   initScrollWithButtons() {
//     var rightId, leftId
//     this.rightTarget.addEventListener('mousedown', (e) => { rightId = setInterval(this.scrollRight.bind(this), 1) })
//     this.rightTarget.addEventListener('mouseup',   (e) => { clearInterval(rightId) })
//     this.rightTarget.addEventListener('mouseleave',(e) => { clearInterval(rightId) })
//     this.leftTarget.addEventListener( 'mousedown', (e) => { leftId = setInterval(this.scrollLeft.bind(this), 1) })
//     this.leftTarget.addEventListener( 'mouseup',   (e) => { clearInterval(leftId) })
//     this.leftTarget.addEventListener( 'mouseleave',(e) => { clearInterval(leftId) })
//   }

//   scrollRight() {
//     this.element.scrollLeft += this.threshold
//   }

//   scrollLeft() {
//     this.element.scrollLeft -= this.threshold
//   }
// }
