import { Component, OnInit, Input } from '@angular/core';
import { IProvider, IProviderAvailableShifts, IProviderSvcCodes } from '../shared/interfaces';
import { ProvidersService } from './provider.service';
import { ToastrService } from 'ngx-toastr';
import { MatDialogModule, MatDialog } from '@angular/material/dialog';
import { HttpClientModule } from '@angular/common/http'; import { HttpModule } from '@angular/http';
import { ModalComponent } from '../modal/modal.component';
import { ModalContent } from '../modal/modalContent';
import { NewProviderFormComponent } from './new-provider-form/new-provider-form.component';
import { ViewEditProviderComponent } from './view-edit-provider/view-edit-provider.component';

@Component({
  moduleId: module.id,
  templateUrl: './providers.component.html',
  styleUrls: ['./providers.component.css'],
  providers: [ModalComponent]
})
export class ProvidersComponent implements OnInit {
  providers: IProvider[];
  providerForm: boolean=false;
  editProviderForm:boolean=false;
  isNewForm: boolean;
  newProvider:any = {};
  viewEditProvider: any = {};
  dialogResult = "";
  isDisabled: boolean = true;
  newSvcCode: any = {};
  newShift: any = {};
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
    this.viewEditProvider = provider;    
  }

  
  showAddProviderForm() {
    this.dialog.openModal(NewProviderFormComponent);
  }

  showViewEditProviderForm(provider) {
    //TODO: To keep consistency and descriptive, rename ViewEditProviderComponent to EditProviderFormComponent
    console.log(provider.providerId + ', ' + provider.firstName);
    this.viewEditProvider = provider;
    console.log(this.viewEditProvider.providerId + ', ' + this.viewEditProvider.firstName);
    
    let dialogRef = this.dialog.openModal(ViewEditProviderComponent, {
      width: '1000px',
      height: '800px',
      data: { comp: this.viewEditProvider }
    });  
  }

  changeToEditable() {   
    this.isDisabled = false;
  }

  addShift() {
    this.viewEditProvider.providerAvailableShifts.push(this.newShift);
    this.newShift = {};
  }

  addSvcCode() {
    console.log(this.newSvcCode);    
    this.viewEditProvider.providerSvcCodes.push(this.newSvcCode);
    this.newSvcCode = {};
  }

  removeSvcCode(svCode) {
    alert(svCode);
    this.viewEditProvider.providerSvcCodes.splice(svCode);
  }

  removeShift(shift) {
    this.viewEditProvider.providerAvailableShifts.splice(shift);
  }
  
  saveProvider(provider: IProvider){
    if (this.isNewForm) {
      //this._providersService.postProviders(provider);
      //this.providersService.addProvider(provider);
      this.toastr.success("Success, you have saved a new provider to the Database!", "Provider")
    }
    else {
      //this is one we have edited
      this.providersService.putProvider(provider);
      this.toastr.success("Success, you have updated this provider in the Database!", "UpdatedProvider")
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

  filterBy(filter: string, event) {
    console.log(filter);
    console.log(event);
    switch (filter) {
      case 'active':
        if (event.target.checked) {
          console.log('filter by active flag that is CHECKED');
          this.providers = this.providers.filter(provider => {
            return provider.active = true
        });
        }
        else {
          console.log('filter by active flag that is NOT CHECKED');
        }
        break;
      case 'inactive':
        if (event.target.checked) {
          console.log('filter by inactive flag that is CHECKED');
        }
        else {
          console.log('filter by inactive flag that is NOT CHECKED');
        }
        break;    
      case 'istherapist':
        if (event.target.checked) {
          console.log('filter by istherapist flag that is CHECKED');
        }
        else {
          console.log('filter by istherapist flag that is NOT CHECKED');
        }
    }
  }
}
