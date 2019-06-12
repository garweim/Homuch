const cardFlipper = () => {
  const button = document.getElementById("flipButton");
  console.log(button);

  if (button) {
    button.addEventListener("click", (event) => {
      const innerCard = document.querySelector(".flip-card-inner");
      innerCard.classList.toggle("rotated");
    })
  }
}

export { cardFlipper }
