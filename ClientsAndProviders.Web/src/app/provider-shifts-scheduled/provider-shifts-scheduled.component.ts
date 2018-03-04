import { Component, Injectable, OnInit } from '@angular/core';
import { IProviderAndProviderAvailableShift } from '../shared/interfaces';
import { ProviderShiftScheduledServiceService } from './provider-shift-scheduled-service.service';
import { HttpClientModule } from '@angular/common/http'; import { HttpModule } from '@angular/http';
import 'rxjs/add/operator/map';
import 'rxjs/add/operator/min';

@Component({
  selector: 'app-provider-shifts-scheduled',
  templateUrl: './provider-shifts-scheduled.component.html',
  styleUrls: ['./provider-shifts-scheduled.component.css']
})
@Injectable()
export class ProviderShiftsScheduledComponent implements OnInit {
  filterShift(shift: IProviderAndProviderAvailableShift) {
    return !shift.hasBeenScheduled === false
      ;
  }

  providerAndProviderAvailableShift: IProviderAndProviderAvailableShift[];
  

  constructor(public providerShiftScheduledSvc: ProviderShiftScheduledServiceService) { }  

  ngOnInit() {    
    this.getProviderAndProviderAvailableShifts();
  }

  getProviderAndProviderAvailableShifts() {    
    this.providerShiftScheduledSvc.getProviderAndProviderAvailableShiftList();
  }

}
