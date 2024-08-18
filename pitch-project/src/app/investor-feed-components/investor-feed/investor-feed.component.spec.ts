import { ComponentFixture, TestBed } from '@angular/core/testing';

import { InvestorFeedComponent } from './investor-feed.component';

describe('InvestorFeedComponent', () => {
  let component: InvestorFeedComponent;
  let fixture: ComponentFixture<InvestorFeedComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [InvestorFeedComponent]
    })
    .compileComponents();

    fixture = TestBed.createComponent(InvestorFeedComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
