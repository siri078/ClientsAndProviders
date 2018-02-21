import { Component, OnInit } from '@angular/core';
import { IProvider, IProviderSvcCodes } from '../../shared/interfaces';
import { ProvidersService } from '../provider.service';

@Component({
  selector: 'app-provider-svc-codes',
  templateUrl: './provider-svc-codes.component.html',
  styleUrls: ['./provider-svc-codes.component.css']
})
export class ProviderSvcCodesComponent implements OnInit {
  providerSvcCodes: any = {};
  newSvcCode: any = {};  

  constructor(private _providersService: ProvidersService) { }

  ngOnInit() {
  }

  addSvcCode() {
    console.log(this.newSvcCode);
    this.providerSvcCodes.push(this.newSvcCode);
    this.newSvcCode = {};
  }
}
