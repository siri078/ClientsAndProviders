import { Component, OnInit } from '@angular/core';
import { IClient, IClientShiftAssignments, IClientSvcCodes } from '../shared/interfaces';
import { ClientsService } from './client.service';
import { clone } from 'lodash';
import { ToastrService } from 'ngx-toastr';

@Component({
  selector: 'app-clients',
  templateUrl: './clients.component.html',
  styleUrls: ['./clients.component.css']
})
export class ClientsComponent implements OnInit {
  clients: IClient[];
  clientShiftAssignments: IClientShiftAssignments[];
  clientSvcCodes: IClientSvcCodes[];
  clientForm: boolean=false;
  editClientForm:boolean=false;
  isNewForm: boolean;
  newClient:any = {};
  editedClient: any={};
  constructor(private _clientsService: ClientsService, private toastr: ToastrService) {}
  
  ngOnInit() {
    this.getClients();
  }
  
  getClients(){
    this.clients = this._clientsService.getClientsFromData();
    //this._providersService.getProviderList();
  }
  
  showEditClientForm(client: IClient){
    
    if(!client) {
      this.clientForm = false;
      return;
    }
    this.editClientForm = true;
    this.editedClient = clone(client);
    
  }
  showAddClientForm(){
    //resets form if its an edited client
    if (this.clients.length){
      this.newClient = {};
    }
    this.clientForm = true;
    this.isNewForm = true;    
  }

  saveClient(client: IClient){
    if(this.isNewForm) {
      this._clientsService.addClient(client);
      this.toastr.success("Success, you have saved a new client to the Database!","Client")
    }
  }

  updateClient() {
      this._clientsService.updateClient(this.editedClient);
      this.editClientForm = false;
      this.editedClient = {};
      this.toastr.success("you have updated a client record!","Client")
  }

  cancelEdits() {
      this.editedClient = {};
      this.editClientForm = false;
  }  

  removeClient(client: IClient) {
    this._clientsService.deleteClient(client);
  }

  cancelNewClient(){
    this.newClient = {};
    this.clientForm = false;
  }
}