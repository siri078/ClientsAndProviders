import { Component, OnInit } from '@angular/core';
import { IProvider, IProviderSvcCodes } from '../../shared/interfaces';
import { ProvidersService } from '../provider.service';

@Component({
  selector: 'app-provider-svc-codes',
  templateUrl: './provider-svc-codes.component.html',
  styleUrls: ['./provider-svc-codes.component.css']
})
export class ProviderSvcCodesComponent implements OnInit {
  public ProviderSvcCodes: IProviderSvcCodes[];
  public ProviderId: number;
  public SvcCode: string;

  constructor(private _providersService: ProvidersService) { }

  ngOnInit() {
  }

  getProviderSvcCodes(providerId) {
    return this._providersService.getProviderSvcCodes(providerId);
  }

}
