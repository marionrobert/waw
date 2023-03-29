import { Controller } from "stimulus"

export default class extends Controller {

  nameautocomplete() {
    console.log("connécté")
    document.addEventListener("DOMContentLoaded", function() {
      const skuField = document.querySelector("#product_sku");
      const widthField = document.querySelector("#product_width");
      const heightField = document.querySelector("#product_height");
      const orientationField = document.querySelector("#product_orientation");
      const supportField = document.querySelector("#product_support");
      const nameField = document.querySelector("#product_name");

      const updateNameField = () => {
        const skuValue = skuField.value.trim();
        const widthValue = widthField.value.trim();
        const heightValue = heightField.value.trim();
        const orientationValue = orientationField.value.trim();
        const supportValue = supportField.value.trim();

        if (skuValue !== "" && widthValue !== "" && heightValue !== "" && orientationValue !== "" && supportValue !== "") {
          const newName = `${skuValue}_${widthValue}x${heightValue}_${orientationValue}_${supportValue}`;
          nameField.value = newName;
        } else {
          nameField.value = "";
        }
      };

      skuField.addEventListener("input", updateNameField);
      widthField.addEventListener("input", updateNameField);
      heightField.addEventListener("input", updateNameField);
      orientationField.addEventListener("input", updateNameField);
      supportField.addEventListener("input", updateNameField);
    });
  }
}
