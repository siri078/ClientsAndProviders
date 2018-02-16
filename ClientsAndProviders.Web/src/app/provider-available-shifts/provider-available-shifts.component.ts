import { Component, OnInit } from '@angular/core';
import { IProvider, IProviderAvailableShifts } from '../shared/interfaces';

@Component({
  selector: 'app-provider-available-shifts',
  templateUrl: './provider-available-shifts.component.html',
  styleUrls: ['./provider-available-shifts.component.css']
})
export class ProviderAvailableShiftsComponent implements OnInit {
  providerShifts: IProviderAvailableShifts[];
  ProviderId: number;
  ProviderWeekday: string;
  ProviderShift: string;
  ProviderIsScheduled: boolean;

  constructor() { }

  ngOnInit() {
  }

}
