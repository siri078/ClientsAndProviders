import { Component, OnInit } from '@angular/core';
import { IClient, IClientShiftAssignments, IClientSvcCodes } from '../shared/interfaces';
import { ClientsService } from './client.service';
import { ToastrService } from 'ngx-toastr';
import { HttpClientModule } from '@angular/common/http';
import { HttpModule } from '@angular/http';
import { MatDialogModule, MatDialog } from '@angular/material/dialog';
import { ModalComponent } from '../modal/modal.component';
import { NewClientFormComponent } from './new-client-form/new-client-form.component';

@Component({
  selector: 'app-clients',
  templateUrl: './clients.component.html',
  styleUrls: ['./clients.component.css'],
  providers: [ModalComponent]
})
export class ClientsComponent implements OnInit {
  clients: IClient[];
  //clientShiftAssignments: IClientShiftAssignments[];
  //clientSvcCodes: IClientSvcCodes[];

  loading = false;
  total = 0;
  page = 1;
  limit = 20;

  constructor(public dialog1: MatDialog, private dialog: ModalComponent, private _clientsService: ClientsService, private toastr: ToastrService) {}
  
  ngOnInit() {
    this.getClients();
  }
  
  getClients(){
      this._clientsService.getClientsList();    
  }

  goToPage(n: number): void {
    this.page = n;
    this.getClients();
  }

  onNext(): void {
    this.page++;
    this.getClients();
  }

  onPrev(): void {
    this.page--;
    this.getClients();
  }
  
  
  showAddClientForm() {    
    this.dialog.openModal(NewClientFormComponent);
  }

  //saveClient(client: IClient){
  //  if(this.isNewForm) {
  //    this._clientsService.addClient(client);
  //    this.toastr.success("Success, you have saved a new client to the Database!","Client")
  //  }
  //}

  //updateClient() {
  //    this._clientsService.updateClient(this.editedClient);
  //    this.editClientForm = false;
  //    this.editedClient = {};
  //    this.toastr.success("you have updated a client record!","Client")
  //}

  //cancelEdits() {
  //    this.editedClient = {};
  //    this.editClientForm = false;
  //}  

  //removeClient(client: IClient) {
  //  this._clientsService.deleteClient(client);
  //}

  //cancelNewClient(){
  //  this.newClient = {};
  //  this.clientForm = false;
  //}
}
