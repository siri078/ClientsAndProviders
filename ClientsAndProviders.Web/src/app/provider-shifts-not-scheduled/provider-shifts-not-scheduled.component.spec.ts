import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ProviderShiftsNotScheduledComponent } from './provider-shifts-not-scheduled.component';

describe('ProviderShiftsNotScheduledComponent', () => {
  let component: ProviderShiftsNotScheduledComponent;
  let fixture: ComponentFixture<ProviderShiftsNotScheduledComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ProviderShiftsNotScheduledComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ProviderShiftsNotScheduledComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
