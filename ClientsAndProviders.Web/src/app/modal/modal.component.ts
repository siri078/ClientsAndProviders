import { Component, OnInit, Inject, Input } from '@angular/core';
import { ModalContent } from '../modal/modalContent';
import { MatDialog } from '@angular/material/dialog';
import { ComponentType } from '@angular/core/src/render3';

@Component({
  selector: 'app-modal',
  templateUrl: './modal.component.html',
  styleUrls: ['./modal.component.css']
})
export class ModalComponent implements OnInit {
  private modalConfig: any = {
    position: {
      //left: '20%',
      //top: '100px'
    },
    disableClose:false
  };

  constructor(public dialog: MatDialog) {

  }

  public openModal(component: any, config: any = this.modalConfig) {
    this.dialog.open(component, config);

    
  }

  public close() { this.dialog.closeAll(); }
  ngOnChanges() {
  }
  ngOnInit() {
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
