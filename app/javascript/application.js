import React from 'react';
import ReactDOM from 'react-dom';
import Hero from './components/Hero';

document.addEventListener('DOMContentLoaded', () => {
  const heroDiv = document.getElementById('hero');
  if (heroDiv) {
    ReactDOM.render(<Hero />, heroDiv);
  }
});
