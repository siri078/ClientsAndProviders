import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-provider-available-shifts',
  templateUrl: './provider-available-shifts.component.html',
  styleUrls: ['./provider-available-shifts.component.css']
})
export class ProviderAvailableShiftsComponent implements OnInit {
  newProvider: any = {};
  newShift: any = {};

  constructor() { }

  ngOnInit() {
  }

  addShift() {
    this.newProvider.providerAvailableShifts.push(this.newShift);
    this.newShift = {};
  }
}
