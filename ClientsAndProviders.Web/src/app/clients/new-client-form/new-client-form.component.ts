import { Component, OnInit } from '@angular/core';
import { IClient } from '../../shared/interfaces';
import { ClientsService } from '../client.service';
import { ToastrService } from 'ngx-toastr';

@Component({
  selector: 'app-new-client-form',
  templateUrl: './new-client-form.component.html',
  styleUrls: ['./new-client-form.component.css']
})
export class NewClientFormComponent implements OnInit {
  newClient: IClient;


  constructor(public clientsService: ClientsService, private toastr: ToastrService) { }

  ngOnInit() {
  }

  saveClient(newClient) {    
    this.clientsService.addClient(newClient);
    console.log(newClient.FirstName);
  }

}
