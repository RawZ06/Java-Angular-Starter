import { Component, inject, OnInit, signal } from '@angular/core';
import { RouterOutlet } from '@angular/router';
import { HttpClient } from '@angular/common/http';

@Component({
  selector: 'app-root',
  imports: [RouterOutlet],
  templateUrl: './app.html',
  styleUrl: './app.css'
})
export class App implements OnInit {
  private http = inject(HttpClient);
  protected readonly title = signal('frontend');
  protected readonly apiMessage = signal('Loading...');

  ngOnInit() {
    this.http.get<{message: string}>('/api/hello').subscribe({
      next: (data) => this.apiMessage.set(data.message),
      error: () => this.apiMessage.set('Error connecting to backend')
    });
  }
}
