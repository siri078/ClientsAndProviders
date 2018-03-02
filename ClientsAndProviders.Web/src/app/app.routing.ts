import { NgModule } from '@angular/core';
import { ModuleWithProviders } from '@angular/core'
import { Routes,RouterModule, PreloadAllModules } from '@angular/router';

import { ProvidersComponent } from './providers/providers.component';
import { ProviderShiftsScheduledComponent } from './provider-shifts-scheduled/provider-shifts-scheduled.component';
import { ProviderShiftsNotScheduledComponent } from './provider-shifts-not-scheduled/provider-shifts-not-scheduled.component';
import { ClientsComponent } from './clients/clients.component';
import { ClientsAssignedComponent } from './clients-assigned/clients-assigned.component';
import { ClientsUnassignedComponent } from './clients-unassigned/clients-unassigned.component';

const routes: Routes = [
  { path: '', pathMatch: 'full', redirectTo: '/providers' },
  { path: 'providers', component: ProvidersComponent },
  { path: 'providerShiftsScheduled', component: ProviderShiftsScheduledComponent },
  { path: 'providerShiftsNotScheduled', component: ProviderShiftsNotScheduledComponent },
  { path: 'clients', component: ClientsComponent },
  { path: 'clientsAssigned', component: ClientsAssignedComponent },
  { path: 'clientsNeedingAssignment', component: ClientsUnassignedComponent }  
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})

export class AppRoutingModule {
  static components = [
    ProvidersComponent, ProviderShiftsScheduledComponent, ProviderShiftsNotScheduledComponent,
    ClientsComponent,ClientsAssignedComponent,ClientsUnassignedComponent
  ];
}
