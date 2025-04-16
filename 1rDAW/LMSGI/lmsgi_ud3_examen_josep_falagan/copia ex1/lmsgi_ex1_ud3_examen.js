const imgProducts = document.querySelectorAll("img");

imgProducts.forEach(img => {
  img.addEventListener("click", function () {
    this.classList.toggle("selected");
  });
});
