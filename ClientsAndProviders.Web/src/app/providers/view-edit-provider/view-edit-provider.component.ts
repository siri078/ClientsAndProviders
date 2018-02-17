import { Component, OnInit } from '@angular/core';
import { IProvider, IProviderSvcCodes } from '../../shared/interfaces';
import { ProvidersService } from '../provider.service';


@Component({
  selector: 'app-view-edit-provider',
  templateUrl: './view-edit-provider.component.html',
  styleUrls: ['./view-edit-provider.component.css']
})
export class ViewEditProviderComponent implements OnInit {
  viewProvider: IProvider;
  isEditable: true;

  constructor() { }

  ngOnInit() {
  }

}
