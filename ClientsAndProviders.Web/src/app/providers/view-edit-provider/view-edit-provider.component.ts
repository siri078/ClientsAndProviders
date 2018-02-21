import { Component, OnInit } from '@angular/core';
import { IProvider, IProviderSvcCodes } from '../../shared/interfaces';
import { ProvidersService } from '../provider.service';


@Component({
  selector: 'app-view-edit-provider',
  templateUrl: './view-edit-provider.component.html',
  styleUrls: ['./view-edit-provider.component.css']
})
export class ViewEditProviderComponent implements OnInit {
  viewEditProvider: any = {};
  dialogResult = "";
  isDisabled: boolean = true;
  newSvcCode: any = {};
  newShift: any = {};

  constructor() { }

  ngOnInit() {    
    
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

}
