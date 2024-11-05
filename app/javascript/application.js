// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"


import Sortable from 'sortablejs';

document.addEventListener('DOMContentLoaded', () => {
  const photoList = document.getElementById('sortable-photos');
  
  if (photoList) {
    Sortable.create(photoList, {
      animation: 150,
      onEnd: () => {
        const order = Array.from(photoList.children).map(item => item.dataset.id);
        
        fetch('/admin/photos/sort', {
          method: 'PATCH',
          headers: {
            'Content-Type': 'application/json',
            'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').content
          },
          body: JSON.stringify({ photo: order })
        });
      }
    });
  }
});
