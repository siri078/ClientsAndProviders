import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ProviderAvailableShiftsComponent } from './provider-available-shifts.component';

describe('ProviderAvailableShiftsComponent', () => {
  let component: ProviderAvailableShiftsComponent;
  let fixture: ComponentFixture<ProviderAvailableShiftsComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ProviderAvailableShiftsComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ProviderAvailableShiftsComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
