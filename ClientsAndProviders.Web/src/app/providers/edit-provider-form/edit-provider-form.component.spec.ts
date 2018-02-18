import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { EditProviderFormComponent } from './edit-provider-form.component';

describe('EditProviderFormComponent', () => {
  let component: EditProviderFormComponent;
  let fixture: ComponentFixture<EditProviderFormComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ EditProviderFormComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(EditProviderFormComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
