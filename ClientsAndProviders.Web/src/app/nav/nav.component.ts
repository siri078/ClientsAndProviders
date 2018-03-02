import { Component } from '@angular/core';
import { Router } from '@angular/router';

@Component({
  moduleId: module.id,
  selector: 'ng-nav',
  templateUrl: 'nav.component.html'
})

export class NavbarComponent {
  appName: string = "Lamar's Clients and Providers"; 
}
