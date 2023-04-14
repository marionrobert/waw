import { Controller } from "@hotwired/stimulus"
import { Alert } from "bootstrap"

export default class extends Controller {
  static targets = ["allframes", "preview", "room1", "room2", "room3", "room4", "room5", "room6", "frame", "framewidth"]

  connect() {
  }



  move_left() {
    // console.log("MOVE FRAME LEFT");
    let X = -5;
    let currentLeft = parseInt(this.frameTarget.style.left) || 0; // obtenir la valeur actuelle de "left" et la convertir en nombre
    let currentLeftwidth = parseInt(this.framewidthTarget.style.left) || 0;

    this.frameTarget.style.left = `${currentLeft + X}px`; // ajouter X à la valeur actuelle de "left" et réassigner à "left"
    this.framewidthTarget.style.left = `${currentLeftwidth + X}px`;
  }

  move_right() {
    // console.log("MOVE FRAME RIGHT");
    let X = 5;
    let currentLeft = parseInt(this.frameTarget.style.left) || 0; // obtenir la valeur actuelle de "left" et la convertir en nombre
    let currentLeftwidth = parseInt(this.framewidthTarget.style.left) || 0;

    this.frameTarget.style.left = `${currentLeft + X}px`; // ajouter X à la valeur actuelle de "left" et réassigner à "left"
    this.framewidthTarget.style.left = `${currentLeftwidth + X}px`;
  }

  move_up() {
    // console.log("MOVE FRAME LEFT");
    let Y = -5;
    let currentTop = parseInt(this.frameTarget.style.top) || 0; // obtenir la valeur actuelle de "left" et la convertir en nombre
    let currentTopwidth = parseInt(this.framewidthTarget.style.top) || 0;

    this.frameTarget.style.top = `${currentTop + Y}px`; // ajouter X à la valeur actuelle de "left" et réassigner à "left"
    this.framewidthTarget.style.top = `${currentTopwidth + Y}px`;
  }

  move_down() {
    // console.log("MOVE FRAME RIGHT");
    let Y = 5;
    let currentTop = parseInt(this.frameTarget.style.top) || 0;    // obtenir la valeur actuelle de "left" et la convertir en nombre
    let currentTopwidth = parseInt(this.framewidthTarget.style.top) || 0;

    this.frameTarget.style.top = `${currentTop + Y}px`; // ajouter X à la valeur actuelle de "left" et réassigner à "left"
    this.framewidthTarget.style.top = `${currentTopwidth + Y}px`;
  }

  rotate_frame_more() {
    // console.log("ROTATE FRAME RIGHT");
    let W = 5;
    let currentTransform = this.frameTarget.style.transform || "perspective(400px) rotateY(0deg)";
    let currentRotation = currentTransform.match(/rotateY\((\d+)deg\)/);
    let newRotation = currentRotation ? parseInt(currentRotation[1]) + W : W;
    this.frameTarget.style.transform = `perspective(400px) rotateY(${newRotation}deg)`;
  }

  rotate_frame_less() {
    // console.log("ROTATE FRAME LEFT");
    let W = -5;
    let currentTransform = this.frameTarget.style.transform || "perspective(400px) rotateY(0deg)";
    let currentRotation = currentTransform.match(/rotateY\(([-]?\d+)deg\)/);
    let newRotation = currentRotation ? parseInt(currentRotation[1]) + W : W;
    this.frameTarget.style.transform = `perspective(400px) rotateY(${newRotation}deg)`;
  }

  bigger_frame() {
    // console.log("TESTBIGGER");

    let frame = document.getElementById("frameadjusting");
    if (!frame) {
      console.error("Element not found.");
      return;
    }
    let currentTransform = frame.style.transform || "scale(1)";
    // console.log(currentTransform)
    let currentScale = parseFloat(currentTransform.slice(6));
    // console.log(currentScale)
    if(currentScale < 1){
      currentScale = 1;
    }
    frame.style.transform = `scale(${currentScale + 0.05})`;
    // console.log(frame.style.transform)
  }

  shrink_frame() {
    // console.log("size_adjust_less")

    let frame = document.getElementById("frameadjusting");
    let currentTransform = getComputedStyle(frame).transform;
    let currentScale = parseFloat(currentTransform.slice(7));
    if(currentScale <= 0.05){
      frame.style.transform = `scale(1)`;
      return;
    }
    frame.style.transform = `scale(${currentScale - 0.05})`;
    // console.log(frame.style.transform)
  }


  change_bg1() {
    this.room1Target.style.display = "";
    this.room2Target.style.display = "none";
    this.room3Target.style.display = "none";
    this.room4Target.style.display = "none";
    this.room5Target.style.display = "none";
    this.room6Target.style.display = "none";

  }

  change_bg2() {
    this.room1Target.style.display = "none";
    this.room2Target.style.display = "";
    this.room3Target.style.display = "none";
    this.room4Target.style.display = "none";
    this.room5Target.style.display = "none";
    this.room6Target.style.display = "none";

  }

  change_bg3() {
    this.room1Target.style.display = "none";
    this.room2Target.style.display = "none";
    this.room3Target.style.display = "";
    this.room4Target.style.display = "none";
    this.room5Target.style.display = "none";
    this.room6Target.style.display = "none";
  }

  change_bg4() {
    this.room1Target.style.display = "none";
    this.room2Target.style.display = "none";
    this.room3Target.style.display = "none";
    this.room4Target.style.display = "";
    this.room5Target.style.display = "none";
    this.room6Target.style.display = "none";
  }

  change_bg5() {
    this.room1Target.style.display = "none";
    this.room2Target.style.display = "none";
    this.room3Target.style.display = "none";
    this.room4Target.style.display = "none";
    this.room5Target.style.display = "";
    this.room6Target.style.display = "none";
  }

  change_bg6() {
    this.room1Target.style.display = "none";
    this.room2Target.style.display = "none";
    this.room3Target.style.display = "none";
    this.room4Target.style.display = "none";
    this.room5Target.style.display = "none";
    this.room6Target.style.display = "";
  }

  hidebutton() {
    let boutton = document.getElementById("simulateurgridmobile");
    let bgselector = document.getElementById("bg_selector");
    let framewidth = document.getElementById("framewidth");
    let brightness_slider = document.getElementById("brightness-slider");

    boutton.classList.toggle("hidden");
    boutton.classList.toggle("simulateurgridmobile");
    framewidth.classList.toggle("hidden");
    framewidth.classList.toggle("d-flex");
    bgselector.classList.toggle("hidden");
    brightness_slider.classList.toggle("hidden");
  }

  noframe() {
    console.log("no frame");
    let mainframe = document.getElementById("mainframe");
    mainframe.classList.remove("brownframe");
    mainframe.classList.remove("blackframe");
    mainframe.classList.remove("blackframepaddingwhite");
    mainframe.classList.remove("whiteframe");
  }

  blackframe() {
    console.log("black frame");
    let mainframe = document.getElementById("mainframe");
    mainframe.classList.remove("brownframe");
    mainframe.classList.add("blackframe");
    mainframe.classList.remove("blackframepaddingwhite");
    mainframe.classList.remove("whiteframe");
  }

  blackframepaddingwhite() {
    console.log("blackframepaddingwhite");
    let mainframe = document.getElementById("mainframe");
    mainframe.classList.remove("brownframe");
    mainframe.classList.add("blackframepaddingwhite");
    mainframe.classList.remove("blackframe");
    mainframe.classList.remove("whiteframe");
  }

  whiteframe() {
    console.log("white frame");
    let mainframe = document.getElementById("mainframe");
    mainframe.classList.add("whiteframe");
    mainframe.classList.remove("blackframepaddingwhite");
    mainframe.classList.remove("blackframe");
    mainframe.classList.remove("brownframe");
  }

  brownframe() {
    console.log("brown frame");
    let mainframe = document.getElementById("mainframe");
    mainframe.classList.add("brownframe");
    mainframe.classList.remove("blackframepaddingwhite");
    mainframe.classList.remove("whiteframe");
    mainframe.classList.remove("blackframe");
  }

}
