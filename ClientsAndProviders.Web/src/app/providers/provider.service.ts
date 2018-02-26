import { Injectable } from '@angular/core';
import { Http, Response, Headers, RequestOptions, RequestMethod } from '@angular/http';
import { Observable } from 'rxjs/Observable';
import 'rxjs/add/operator/map';
import 'rxjs/add/operator/toPromise';

import { IProvider, IProviderAvailableShifts, IProviderSvcCodes } from '../shared/interfaces';
import { findIndex } from 'lodash';
import { HeaderRowPlaceholder } from '@angular/cdk/table';
//import { request } from 'http';

@Injectable()
export class ProvidersService{
    constructor(private http: Http) { }
    providerList: IProvider[];
    providerSvcCodes: IProviderSvcCodes[];

    postProviders(provider: IProvider){
        var body = JSON.stringify(provider);
        var headerOptions = new Headers({'Content-Type': 'application/json'});
        var requestOptions = new RequestOptions({ method: RequestMethod.Post, headers: headerOptions });
        return this.http.post('http://localhost/ClientAndProvidersApi/api/providers', body, requestOptions).map(x => x.json());
    }

    putProvider(provider: IProvider) {
      console.log(provider.firstName);
      var body = JSON.stringify(provider);
      var headerOptions = new Headers({ 'Content-Type': 'application/json' });
      var requestOptions = new RequestOptions({ method: RequestMethod.Put, headers: headerOptions });
      return this.http.put('http://localhost/ClientAndProvidersApi/api/providers', body, requestOptions).map(x => x.json());
    }

    getProviderList() {
        this.http.get('http://localhost/ClientAndProvidersApi/api/providers')
        .map((data : Response) => {
            return data.json() as IProvider[];
        }).toPromise().then(x => {
            this.providerList = x;
        })
    }

    getProviderSvcCodes(providerId) {
      this.http.get('http://localhost/ClientAndProvidersApi/api/providerSvcCodes/' + providerId)
        .map((data: Response) => {
          return data.json() as IProviderSvcCodes[];
        }).toPromise().then(x => {
          this.providerSvcCodes = x;
        })
    }
   
    //getProvidersFromData(): IProvider[] {
    //    console.log(this.pItems);
    //    return this.pItems;
    //}
    
    //addProvider(provider: IProvider){
    //    this.pItems.push(provider);
    //    console.log(this.pItems);
    //}

    //updateProvider(provider: IProvider){
    //    let index = findIndex(this.pItems,(p: IProvider) => {
    //    return p.ProviderId === provider.ProviderId;
    //    })
    //    this.pItems[index] = provider;
    //}

    //deleteProvider(provider: IProvider){
    //    this.pItems.splice(this.pItems.indexOf(provider),1);
    //    console.log(this.pItems);
    //}
   
}
