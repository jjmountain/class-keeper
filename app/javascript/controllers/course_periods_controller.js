import { Controller } from 'stimulus';

export default class extends Controller {
  static targets = ['course_period']

  show_course_period_form(event) {
    event.preventDefault();
    if (this.course_periodTarget.style.display === 'none') {
      this.course_periodTarget.style.display = 'block';
    } else {
      this.course_periodTarget.style.display = 'none';
    }
  }

}