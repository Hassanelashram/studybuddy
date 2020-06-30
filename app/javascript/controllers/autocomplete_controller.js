import { Controller } from "stimulus";

export default class extends Controller {
  static targets = [ 'input', 'suggestions' ];

  suggest() {
    fetch(`/autocomplete?query=${this.query}`, { headers: {accept: "application/json"} })
    .then(response => response.json())
    .then(({subjects}) => {
      const html = subjects.map(name => this.renderSuggestion(name)).join('')
      this.suggestionsTarget.innerHTML = html
    })
  }

  renderSuggestion(name) {
    return `
    <li class='p-2' data-action="click->suggestion#visit" data-controller="suggestion">
     <img width='25px' class='mr-3' src="https://image.flaticon.com/icons/svg/106/106430.svg">${name}
    </li>`
  }

  get query() {
    return this.inputTarget.value
  }
}
