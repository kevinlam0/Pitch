import { Component } from '@angular/core';
import { RouterOutlet } from '@angular/router';
import { RegisterScreen1Component } from './register-screen-1/register-screen-1.component';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-root',
  standalone: true,
  imports: [RouterOutlet, RegisterScreen1Component, CommonModule],
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  title = 'pitch-project';
}
