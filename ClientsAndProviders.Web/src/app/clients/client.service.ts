import { Injectable } from '@angular/core';
import { Http, Response, Headers, RequestOptions, RequestMethod } from '@angular/http';
import { Observable } from 'rxjs/Observable';
import 'rxjs/add/operator/map';
import 'rxjs/add/operator/toPromise';

import { IClient, IClientShiftAssignments, IClientSvcCodes } from '../shared/interfaces';
import { CLIENT_LIST } from './client.data';
import { findIndex } from 'lodash';
import { HeaderRowPlaceholder } from '@angular/cdk/table';

@Injectable()
export class ClientsService{
    constructor(private http: Http) { }
    clientList: IClient[];
    private cItems = [];//PROVIDER_LIST;

    postClients(provider: IClient){
        var body = JSON.stringify(provider);
        var headerOptions = new Headers({'Content-Type': 'application/json'});
        var requestOptions = new RequestOptions({ method: RequestMethod.Post, headers: headerOptions });
        return this.http.post('http://localhost/ClientAndProviders.Web.Api/api/clients', body, requestOptions).map(x => x.json());
    }

    getClientsList() {
        this.http.get('http://localhost/ClientAndProviders.Web.Api/api/clients')
        .map((data : Response) => {
            return data.json() as IClient[];
        }).toPromise().then(x => {
            this.clientList = x;
        })
    }
   
    getClientsFromData(): IClient[] {
        console.log(this.cItems);
        return this.cItems;
    }
    
    addClient(provider: IClient){
        this.cItems.push(provider);
        console.log(this.cItems);
    }

    updateClient(client: IClient){
        let index = findIndex(this.cItems,(c: IClient) => {
        return c.ClientId === client.ClientId;
        })
        this.cItems[index] = client;
    }

    deleteClient(client: IClient){
        this.cItems.splice(this.cItems.indexOf(client),1);
        console.log(this.cItems);
    }
   
}