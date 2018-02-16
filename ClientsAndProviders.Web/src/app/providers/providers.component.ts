import { Component, OnInit, Input } from '@angular/core';
import { IProvider, IProviderAvailableShifts, IProviderSvcCodes } from '../shared/interfaces';
import { ProvidersService } from './provider.service';
import { clone } from 'lodash';
import { ToastrService } from 'ngx-toastr';
import { MatDialogModule, MatDialog } from '@angular/material/dialog';

import { ModalComponent } from '../modal/modal.component';
import { ModalContent } from '../modal/modalContent';
import * as $ from 'jquery';


@Component({
  moduleId: module.id,
  templateUrl: './providers.component.html',
  styleUrls: ['./providers.component.css']
})
export class ProvidersComponent implements OnInit {
  providerAvailableShifts: IProviderAvailableShifts[];
  @Input() modalContent: ModalContent;
  providerSvcCodes: IProviderSvcCodes[];
  providerForm: boolean=false;
  editProviderForm:boolean=false;
  isNewForm: boolean;
  newProvider:any = {};
  editedProvider: any={};
  dialogResult = "";
  @Input() modalOpen: boolean = false;

  constructor(public providersService: ProvidersService, private toastr: ToastrService) { }
  ngOnInit() {
    this.getProviders();
  }
  
  
  getProviders() {
    this.providersService.getProviderList();
  }
  
  showEditProviderForm(provider: IProvider){
    
    if(!provider) {
      this.providerForm = false;
      return;
    }
    this.editProviderForm = true;
    this.editedProvider = clone(provider);
    
  }

  public openModal() {
    this.modalContent = ModalContent.newProviderForm;
    this.modalOpen = true;
    //$('#myModal').on('shown.bs.modal', function () {
    //  $('#myInput').focus()
    //})
    //$('#myModal').modal('show');//.on('shown.bs.modal', function () {
     /// $('#myInput').focus()
    //})
  }
  showAddProviderForm(){
    //resets form if its an edited provider
    //if (this.providers.length){
    //  this.newProvider = {};
    //}
    this.providerForm = true;
    this.isNewForm = true;    
  }

  saveProvider(provider: IProvider){
    if(this.isNewForm) {
      //add new product
      //this._providersService.postProviders(provider);
      //this.providersService.addProvider(provider);
      this.toastr.success("Success, you have saved a new provider to the Database!","Provider")
    }
  }

  updateProvider() {
      //this.providersService.updateProvider(this.editedProvider);
      this.editProviderForm = false;
      this.editedProvider = {};
      this.toastr.success("you have saved a new provider!","Provider")
  }

  cancelEdits() {
      this.editedProvider = {};
      this.editProviderForm = false;
  }  

  removeProvider(provider: IProvider) {
    //this.providersService.deleteProvider(provider);
  }

  cancelNewProvider(){
    this.newProvider = {};
    this.providerForm = false;
  }
}
