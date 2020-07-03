import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "input" ]

  clearInput() {
    this.input.value = '';
  }

  get input() {
    return this.inputTarget;
  }
}