import { Component } from '@angular/core';

@Component({
  selector: 'app-text-area',
  template: `
        <h1>Text Area</h1>
        <textarea ref-textarea [(ngModel)]="textValue" rows="4"></textarea><br/>
        <pre>{{log}}</pre>`
})
export class TextAreaComponent {

  textValue = 'initial value';
}