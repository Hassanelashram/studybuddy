import { Controller } from "stimulus";

export default class extends Controller {
  static targets = [ 'input', 'suggestions' ];

  suggest() {
    fetch(`/autocomplete?query=${this.query}`, { headers: {accept: "application/json"} })
    .then(response => response.json())
    .then(({subjects}) => {
      const html = subjects.map(name => this.renderSuggestion(name)).join('')
      console.log(subjects)
      this.suggestionsTarget.innerHTML = html
    })
  }

  renderSuggestion(name) {
    return `<li data-action="click->suggestion#visit" data-controller="suggestion">${name}</li>`
  }

  get query() {
    return this.inputTarget.value
  }
}
