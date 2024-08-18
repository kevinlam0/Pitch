import { Component } from '@angular/core';
import { RouterOutlet } from '@angular/router';
import { RegisterScreen1Component } from './register-screen-1/register-screen-1.component';
import { ControlsComponent } from './investor-feed-components/controls/controls.component';
import { CommonModule } from '@angular/common';
import { HeaderComponent } from './investor-feed-components/header/header.component';
import { InvestorFeedComponent } from './investor-feed-components/investor-feed/investor-feed.component';

@Component({
  selector: 'app-root',
  standalone: true,
  imports: [
    RouterOutlet,
    CommonModule,

    RegisterScreen1Component,

    ControlsComponent,
    HeaderComponent, 
    InvestorFeedComponent],
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  title = 'pitch-project';
}
