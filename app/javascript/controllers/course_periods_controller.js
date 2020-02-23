import { Controller } from 'stimulus';

export default class extends Controller {
  static targets = ['course_period', 'periods']

  toggle_course_periods_form(event) {
    event.preventDefault();
    if (this.course_periodTarget.style.display === 'none') {
      this.course_periodTarget.style.display = 'block';
    } else {
      this.course_periodTarget.style.display = 'none';
    }
  }

  toggle_periods_form(event) {
    event.preventDefault();
    if (this.periodsTarget.style.display === 'none') {
      this.periodsTarget.style.display = 'block';
    } else {
      this.periodsTarget.style.display = 'none';
    }
  }


}