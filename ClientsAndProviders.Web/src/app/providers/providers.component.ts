import { Component, OnInit, Input } from '@angular/core';
import { IProvider, IProviderAvailableShifts, IProviderSvcCodes } from '../shared/interfaces';
import { ProvidersService } from './provider.service';
import { clone } from 'lodash';
import { ToastrService } from 'ngx-toastr';
import { MatDialogModule, MatDialog } from '@angular/material/dialog';
import { HttpClientModule } from '@angular/common/http'; import { HttpModule } from '@angular/http';
import { ModalComponent } from '../modal/modal.component';
import { ModalContent } from '../modal/modalContent';
import { NewProviderFormComponent } from './new-provider-form/new-provider-form.component';
import { ViewEditProviderComponent } from './view-edit-provider/view-edit-provider.component';
import { EditProviderFormComponent } from './edit-provider-form/edit-provider-form.component';

@Component({
  moduleId: module.id,
  templateUrl: './providers.component.html',
  styleUrls: ['./providers.component.css'],
  providers: [ModalComponent]
})
export class ProvidersComponent implements OnInit {
  providerAvailableShifts: IProviderAvailableShifts[];
  providerSvcCodes: IProviderSvcCodes[];
  providerForm: boolean=false;
  editProviderForm:boolean=false;
  isNewForm: boolean;
  newProvider:any = {};
  viewProvider: any = {};
  viewEditProvider: any = {};
  dialogResult = "";
  isDisabled: boolean=true;  
  @Input() modalOpen: boolean = false;

  constructor(public dialog1: MatDialog, private dialog: ModalComponent, public providersService: ProvidersService, private toastr: ToastrService) { }
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
    this.viewEditProvider = clone(provider);    
  }

  
  showAddProviderForm() {
    this.dialog.openModal(NewProviderFormComponent);
  }

  showViewEditProviderForm(provider) {
    //TODO: To keep consistency and descriptive, rename ViewEditProviderComponent to EditProviderFormComponent
    this.dialog.openModal(ViewEditProviderComponent);
  }

  changeToEditable() {   
    this.isDisabled = false;
  }

  //editProviderForm(provider) {
  //  this.dialog.openModal(EditProviderFormComponent);
  //}

  saveProvider(provider: IProvider){
    if(this.isNewForm) {
      //add new product
      //this._providersService.postProviders(provider);
      //this.providersService.addProvider(provider);
      this.toastr.success("Success, you have saved a new provider to the Database!","Provider")
    }
  }

  //updateProvider() {
  //    //this.providersService.updateProvider(this.editedProvider);
  //    this.editProviderForm = false;
  //    this.editedProvider = {};
  //    this.toastr.success("you have saved a new provider!","Provider")
  //}

  cancelViewEditForm() {
      this.viewEditProvider = {};
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
