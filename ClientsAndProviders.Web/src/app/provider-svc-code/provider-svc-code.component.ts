import { Component, OnInit } from '@angular/core';
import { IProvider, IProviderSvcCodes } from '../shared/interfaces';
import { formControlBinding } from '@angular/forms/src/directives/ng_model';
import { FormControl } from '@angular/forms';
import {ICheckableItem } from '../shared/interfaces';



@Component({
  selector: 'app-provider-svc-code',
  templateUrl: './provider-svc-code.component.html',
  styleUrls: ['./provider-svc-code.component.css']
})
export class ProviderSvcCodeComponent implements OnInit {
  providerSvcCodes: IProviderSvcCodes[];
  public svcCodeOptions: ICheckableItem[] = [
    { value: 'ATC', isChecked: false },
    { value: 'ECH', isChecked: false },
    { value: 'HAH', isChecked: false },
    { value: 'RSP', isChecked: false }
  ];
  
  ngOnInit() {
    
  }

  // public directionOptionsChanged() {
  //   let selectedValues: ICheckableItem[] = [];
  //   this.groupCDirectionOptions.forEach((item: ICheckableItem) => {
  //     if (item.isChecked) {
  //       let i = this.groupCDirectionOptions.indexOf(item);
  //       let newItem = {
  //         isChecked: false, value: this.groupCService.results[i].uom
  //       };
  //       let matchFound = selectedValues.filter((item) => { return item.value == newItem.value }).length > 0;
  //       if (!matchFound) {
  //         selectedValues.push(newItem)
  //       }
  //     }
  //   });
  //   this.groupCUOMOptions = selectedValues.sort((a, b) => { return a < b ? -1 : 1 });
  // }
  
}
