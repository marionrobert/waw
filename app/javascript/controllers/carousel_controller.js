import { Controller } from "stimulus";

export default class extends Controller {
  connect() {
    console.log("controller carousel connecte");
    window.addEventListener("load", this.initialize.bind(this));
  }

  initialize() {
    this.carouselgroupContent = this.element.querySelector(".carouselgroup-content");
    this.prevButton = this.element.nextElementSibling;
    this.nextButton = this.prevButton.nextElementSibling;
    this.carouselgroupItemWidth = this.element.querySelector(".carouselgroup-item").clientWidth;
    this.index = 0;

    this.prevButton.addEventListener("click", this.prev.bind(this));
    this.nextButton.addEventListener("click", this.next.bind(this));
    console.log("fin de connect");
  }

  prev() {
    console.log("clic prev carousel");
    this.index = this.index > 0 ? this.index - 1 : 0;
    this.carouselgroupContent.style.transform = `translateX(-${this.index * this.carouselgroupItemWidth * 0.4}px)`;
    console.log("fin de clic prev carousel");
  }

  next() {
    console.log("clic next carousel");
    this.index = this.index < this.carouselgroupContent.children.length - 1 ? this.index + 1 : this.index;
    this.carouselgroupContent.style.transform = `translateX(-${this.index * this.carouselgroupItemWidth * 0.4}px)`;
    console.log("fin de clic next carousel");
  }
}
