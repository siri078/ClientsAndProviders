import { Component, OnInit, Inject, Input } from '@angular/core';
import { ModalContent } from '../modal/modalContent';
import * as $ from 'jquery';


/*
import { MatDialogRef } from '@angular/material/dialog'
import { MAT_DIALOG_DATA } from  '@angular/material/dialog';
*/

@Component({
  selector: 'app-modal',
  templateUrl: './modal.component.html',
  styleUrls: ['./modal.component.css']
})
export class ModalComponent implements OnInit {
  private _open: boolean;
  private _content: ModalContent;
  @Input() set open(value: boolean) {
    this._open = value;
    if (this.open) {
      $('#myModal').modal('show');
    }
    else {
      $('#myModal').modal('hide');
    }
  }
  @Input() set Content(value: ModalContent) {
    this._content = value;
  }

  constructor() {

  }  


  ngOnChanges() {
    if (this.open) {
      $('#myModal').on('shown.bs.modal', function () {
        $('#myInput').focus()
      })
    }
  }
  ngOnInit() {
  this.open
  }
  /*
  onCloseConfirm(){
    this.thisDialogRef.close('Confirm');
  }
  onCloseCancel(){
    this.thisDialogRef.close('Cancel');
  }
  */
}
