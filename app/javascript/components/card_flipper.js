const cardFlipper = () => {
  // const button = document.getElementById("flipButton");
  const buttons = document.querySelectorAll(".flipButton");
  console.log(buttons);

  if (buttons) {
    buttons.forEach(function(button){
      button.addEventListener("click", (event) => {
        console.log(event);
        const innerCard = document.querySelector(".flip-card-inner");
        innerCard.classList.toggle("rotated");
      })
    })
  }
}

export { cardFlipper }
