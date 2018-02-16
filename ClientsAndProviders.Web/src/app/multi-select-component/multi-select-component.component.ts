import { Component, OnInit, Input, ChangeDetectionStrategy } from '@angular/core';
import {ICheckableItem } from '../shared/interfaces';
import * as $ from 'jquery/dist/jquery.min.js';

@Component({
  selector: 'app-multi-select-component',
  templateUrl: './multi-select-component.component.html',
  styleUrls: ['./multi-select-component.component.css']
})
export class MultiSelectComponentComponent implements OnInit {
  private optionsLength:number = 0;

  constructor() { };

  @Input('options')
  set options(items: any[]) {
    this.checkableOptions = items;
  };
  get options() {
    return this.checkableOptions;
  }

  @Input() label: string;

  ngOnInit() {
  }

  public checkableOptions: ICheckableItem[];
  public allChecked: boolean;

  public select(index: number, option: ICheckableItem) {
    this.checkableOptions[index] = { isChecked: !option.isChecked, value: option.value };
    if (this.allChecked
      && this.checkableOptions.filter((item) => { return item.isChecked }).length < this.optionsLength)
    {
      this.allChecked = false;
    }
  }

  public selectAllClicked() {
    this.allChecked = !this.allChecked;
    for (let i = 0; i < this.checkableOptions.length; i++)
    {
      this.checkableOptions[i] = { isChecked: this.allChecked, value: this.checkableOptions[i].value };
    }
  }

  public ngDoCheck() {
    if (this.optionsLength != this.options.length)
    {
      this.optionsLength = this.options.length;
      
      for (let i = 0; i < this.optionsLength; i++)
      {
        this.checkableOptions[i] = { isChecked: this.allChecked, value: this.checkableOptions[i].value };
      }
    }
  }
}