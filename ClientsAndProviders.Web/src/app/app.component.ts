import { Component } from '@angular/core';
import { ViewType } from './types/ViewType';

@Component({
  moduleId: module.id,
  selector: 'ng-app',
  templateUrl: 'app.component.html'
})

export class AppComponent {
  public selectedView: ViewType;

  constructor() {
    this.selectedView = 0;
  }

  public changeSelected(value: ViewType) {
    this.selectedView = value;
  }
}
