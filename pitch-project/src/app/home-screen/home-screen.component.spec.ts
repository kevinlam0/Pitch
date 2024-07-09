import { Component } from '@angular/core';

@Component({
  selector: 'app-home-screen',
  templateUrl: './home-screen.component.html',
  styleUrls: ['./home-screen.component.css']
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
