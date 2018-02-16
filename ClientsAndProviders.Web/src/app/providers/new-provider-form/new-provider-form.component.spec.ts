import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { NewProviderFormComponent } from './new-provider-form.component';

describe('NewProviderFormComponent', () => {
  let component: NewProviderFormComponent;
  let fixture: ComponentFixture<NewProviderFormComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ NewProviderFormComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(NewProviderFormComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
