import { Injectable } from '@angular/core';
import { Http, Response, Headers, RequestOptions, RequestMethod } from '@angular/http';
import { Observable } from 'rxjs/Observable';
import 'rxjs/add/operator/map';
import 'rxjs/add/operator/toPromise';

import { IProviderAndProviderAvailableShift } from '../shared/interfaces';

@Injectable()
export class ProviderShiftScheduledServiceService {
  constructor(private http: Http) { }
  providerAndProviderAvailableShiftList: IProviderAndProviderAvailableShift[];

  getProviderAndProviderAvailableShiftList() {    
    this.http.get('http://localhost/ClientAndProvidersApi/api/providerAvailableshifts/')
      .map((data: Response) => {
        return data.json() as IProviderAndProviderAvailableShift[];
      }).toPromise().then(x => {
        this.providerAndProviderAvailableShiftList = x;
      })
  }

}
