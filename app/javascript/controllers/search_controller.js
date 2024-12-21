import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    console.log('reviews connected')
  }
  toggleSearchModal(){
    document.getElementById('search').click();

  }
}
