import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { RouterModule } from '@angular/router';
import { AppRoutingModule } from './app.routing';
import { HttpModule } from '@angular/http';
import { HttpClientModule } from '@angular/common/http';
import { AppComponent } from './app.component';
import { ProvidersComponent } from './providers/providers.component';
import { NavbarComponent } from './nav/nav.component';

import { ProvidersService } from './providers/provider.service'
import { AngularFontAwesomeModule } from 'angular-font-awesome';
import { ModalComponent } from './modal/modal.component';
import { ToastrModule } from 'ngx-toastr';

import { MultiSelectComponentComponent } from './multi-select-component/multi-select-component.component';


import { MatDialogModule } from '@angular/material';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { ProviderSvcCodesComponent } from './providers/provider-svc-codes/provider-svc-codes.component';
import { NewProviderFormComponent } from './providers/new-provider-form/new-provider-form.component';
import { ViewEditProviderComponent } from './providers/view-edit-provider/view-edit-provider.component';
import { ProviderAvailableShiftsComponent } from './providers/provider-available-shifts/provider-available-shifts.component';

@NgModule({
  imports: [BrowserModule,
    FormsModule,
    ReactiveFormsModule,
    AppRoutingModule,
    AngularFontAwesomeModule,
    HttpModule,
    MatDialogModule,
    BrowserAnimationsModule,
    ToastrModule.forRoot()
  ],  
  declarations: [
    AppComponent,
    ProvidersComponent,
    NavbarComponent,
    ModalComponent,    
    MultiSelectComponentComponent, 
    NewProviderFormComponent,
    ProviderSvcCodesComponent,
    ViewEditProviderComponent,
    ProviderAvailableShiftsComponent
  ],
  entryComponents: [ModalComponent, NewProviderFormComponent, ViewEditProviderComponent],
  providers: [ProvidersService, HttpClientModule],
  bootstrap: [AppComponent]
})

export class AppModule { }
