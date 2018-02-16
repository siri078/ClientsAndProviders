import { NgModule } from '@angular/core';
import {RouterModule, PreloadAllModules } from '@angular/router';
import { ProvidersComponent } from './providers/providers.component';

@NgModule({
    imports:[
        RouterModule.forRoot([
           { path: '',component: ProvidersComponent},
           { path: '**',redirectTo:'',pathMatch:'full' }
        ], { preloadingStrategy: PreloadAllModules })
    ],
    exports:[ RouterModule ]      
})
export class AppRoutingModule{}
    
 