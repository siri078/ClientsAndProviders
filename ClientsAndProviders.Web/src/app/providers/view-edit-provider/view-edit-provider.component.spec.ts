import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ViewEditProviderComponent } from './view-edit-provider.component';

describe('ViewEditProviderComponent', () => {
  let component: ViewEditProviderComponent;
  let fixture: ComponentFixture<ViewEditProviderComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ViewEditProviderComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ViewEditProviderComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
