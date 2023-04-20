import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="carousel-homepage"
export default class extends Controller {
  static targets = ["carousel", "cardcarousel"]

  connect() {
    console.log("testouille")
    console.log(this.carouselTarget)
    console.log(this.cardcarouselTargets)
    this.transformValue = 0
    window.addEventListener("resize", () => this.resetTransformValue());
  }

  scroll_left() {
    if (window.innerWidth < 700) {
      if (this.transformValue >= 0) {
        this.transformValue = (this.cardcarouselTargets.length) * -100;
      }
      this.transformValue += 100;
      this.carouselTarget.style.transform = `translateX(${this.transformValue}vw)`;
    } else {
      if (this.transformValue >= 0) {
        this.transformValue = (this.cardcarouselTargets.length - 1) * -25;
      }
      this.transformValue += 25;
      this.carouselTarget.style.transform = `translateX(${this.transformValue}vw)`;
    }
  }

  scroll_right() {
    if (window.innerWidth < 700) {
      if (this.transformValue <= (this.cardcarouselTargets.length - 1) * -100) {
        this.transformValue = 100;
      }
      this.transformValue -= 100;
      this.carouselTarget.style.transform = `translateX(${this.transformValue}vw)`;
    } else {
      if (this.transformValue <= (this.cardcarouselTargets.length - 1) * -25) {
        this.transformValue = 25;
      }
      this.transformValue -= 25;
      this.carouselTarget.style.transform = `translateX(${this.transformValue}vw)`;
    }
  }

  resetTransformValue() {
    this.transformValue = 0;
    this.carouselTarget.style.transform = `translateX(${this.transformValue})`;
  }
}
