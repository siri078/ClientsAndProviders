import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ProviderShiftsScheduledComponent } from './provider-shifts-scheduled.component';

describe('ProviderShiftsScheduledComponent', () => {
  let component: ProviderShiftsScheduledComponent;
  let fixture: ComponentFixture<ProviderShiftsScheduledComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ProviderShiftsScheduledComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ProviderShiftsScheduledComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
