import { Component } from '@angular/core';

@Component({
  selector: 'app-register-screen-1',
  templateUrl: './register-screen-1.component.html',
  styleUrls: ['./register-screen-1.component.css']
})
export class HomeScreenComponent {

  constructor() { }

  ngOnInit(): void {
    // Initialization logic if needed
  }

  login(): void {
    console.log('Login button clicked');
    // TODO: Add further login logic here
  }

  register(): void {
    console.log('Register button clicked');
    // TODO: Add further registration logic here
  }
}
