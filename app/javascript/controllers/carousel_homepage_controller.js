import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="carousel-homepage"
export default class extends Controller {
  static targets = ["carouselpromo", "cardcarouselpromo"]

  connect() {
    console.log("test!!!")
    console.log(this.carouselpromoTarget)
    console.log(this.cardcarouselpromoTargets)
    this.transformValue = 0
    window.addEventListener("resize", () => this.resetTransformValue());
  }

  scroll_left() {
    console.log("scroll left function has been triggered")

    if (window.innerWidth < 700) {
      if (this.transformValue >= 0) {
        this.transformValue = (this.cardcarouselpromoTargets.length) * -100;
      }
      this.transformValue += 100;
      this.carouselpromoTarget.style.transform = `translateX(${this.transformValue}vw)`;
    } else {
      if (this.transformValue >= 0) {
        this.transformValue = (this.cardcarouselpromoTargets.length - 1) * -25;
      }
      this.transformValue += 25;
      this.carouselpromoTarget.style.transform = `translateX(${this.transformValue}vw)`;
    }
  }

  scroll_right() {
    console.log("scroll right function has been triggered")
    if (window.innerWidth < 700) {
      if (this.transformValue <= (this.cardcarouselpromoTargets.length - 1) * -100) {
        this.transformValue = 100;
      }
      this.transformValue -= 100;
      this.carouselpromoTarget.style.transform = `translateX(${this.transformValue}vw)`;
    } else {
      if (this.transformValue <= (this.cardcarouselpromoTargets.length - 1) * -25) {
        this.transformValue = 25;
      }
      this.transformValue -= 25;
      this.carouselpromoTarget.style.transform = `translateX(${this.transformValue}vw)`;
    }
  }

  resetTransformValue() {
    this.transformValue = 0;
    this.carouselpromoTarget.style.transform = `translateX(${this.transformValue})`;
  }
}
