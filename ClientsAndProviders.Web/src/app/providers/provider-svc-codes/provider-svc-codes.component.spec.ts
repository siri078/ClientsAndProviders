import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ProviderSvcCodesComponent } from './provider-svc-codes.component';

describe('ProviderSvcCodesComponent', () => {
  let component: ProviderSvcCodesComponent;
  let fixture: ComponentFixture<ProviderSvcCodesComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ProviderSvcCodesComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ProviderSvcCodesComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
