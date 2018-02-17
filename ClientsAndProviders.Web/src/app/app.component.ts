import { Component } from '@angular/core';
import { ViewType } from './types/ViewType';
import { HttpClientModule } from '@angular/common/http'; import { HttpModule } from '@angular/http';
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
