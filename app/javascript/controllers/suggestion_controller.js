import { Controller } from "stimulus";
import  Turbolinks from "turbolinks";

export default class extends Controller {
  visit(){
    Turbolinks.visit(this.url)
  }

  get url() {
    return `results?query=${this.element.innerText}`;
  }
}
