import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { FormsModule } from '@angular/forms';
import { RouterModule } from '@angular/router';
import { AppRoutingModule } from './app.routing';
import { HttpModule } from '@angular/http';

import { AppComponent } from './app.component';
import { ProvidersComponent } from './providers/providers.component';
import { NavbarComponent } from './nav/nav.component';

import { ProvidersService} from './providers/provider.service'
import { AngularFontAwesomeModule } from 'angular-font-awesome';
import { ModalComponent } from './modal/modal.component';
import { ToastrModule } from 'ngx-toastr';

import { ProviderSvcCodeComponent } from './provider-svc-code/provider-svc-code.component';
import { ProviderAvailableShiftsComponent } from './provider-available-shifts/provider-available-shifts.component';
import { MultiSelectComponentComponent } from './multi-select-component/multi-select-component.component';
import { NewProviderFormComponent } from './providers/new-provider-form/new-provider-form.component';

/*
import { MatCardModule } from '@angular/material';
import { MatButtonModule } from '@angular/material';
import { MatDialogModule } from '@angular/material/dialog';
*/


@NgModule({
  imports: [ BrowserModule,
                   FormsModule,
                   AppRoutingModule,
                   AngularFontAwesomeModule,
                   HttpModule,                 
                   ToastrModule.forRoot()                   
                   ],
  declarations: [ AppComponent,
                          ProvidersComponent,
                          NavbarComponent,
                          ModalComponent,
                          ProviderSvcCodeComponent,
                          ProviderAvailableShiftsComponent,
                          MultiSelectComponentComponent,
                          NewProviderFormComponent
                          ],
  providers: [ ProvidersService ],
  bootstrap:    [ AppComponent ]
})

export class AppModule { }
