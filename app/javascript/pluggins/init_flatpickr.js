

const schedual = () => {
  const inputs = document.querySelectorAll(".kasi")
  console.log(inputs)
  inputs.forEach((input) => {
    flatpickr(input, {
      enableTime: true,
      dateFormat: "Y-m-d H:i",
    })
  })
}

export {schedual}
