import { Component, OnInit } from '@angular/core';
import { IProvider } from '../../shared/interfaces';

@Component({
  selector: 'app-new-provider-form',
  templateUrl: './new-provider-form.component.html',
  styleUrls: ['./new-provider-form.component.css']
})
export class NewProviderFormComponent implements OnInit {
  newProvider: IProvider;
  newSvcCode: any = {};

  constructor() { }

  ngOnInit() {
  }

  addSvcCode() {
    console.log(this.newSvcCode);
    this.newProvider.providerSvcCodes.push(this.newSvcCode);
    this.newSvcCode = {};
  }
}
