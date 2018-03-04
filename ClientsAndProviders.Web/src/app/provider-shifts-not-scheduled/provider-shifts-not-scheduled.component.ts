import { Component, Injectable, OnInit } from '@angular/core';
import { IProviderAndProviderAvailableShift } from '../shared/interfaces';
import { ProviderShiftNotScheduledServiceService } from './provider-shift-not-scheduled-service.service';
import { HttpClientModule } from '@angular/common/http'; import { HttpModule } from '@angular/http';
import 'rxjs/add/operator/map';
import 'rxjs/add/operator/min';

@Component({
  selector: 'app-provider-shifts-not-scheduled',
  templateUrl: './provider-shifts-not-scheduled.component.html',
  styleUrls: ['./provider-shifts-not-scheduled.component.css']
})
@Injectable()
export class ProviderShiftsNotScheduledComponent implements OnInit {
  filterShift(shift: IProviderAndProviderAvailableShift) {
    return !shift.hasBeenScheduled === true;
  }
  constructor(public providerShiftNotScheduledSvc: ProviderShiftNotScheduledServiceService) { }

  ngOnInit() {
    this.getProviderAndProviderAvailableShifts();
  }

  getProviderAndProviderAvailableShifts() {
    this.providerShiftNotScheduledSvc.getProviderAndProviderAvailableShiftList();
  }

}
