import React from 'react';
import { fireEvent, render, screen, waitFor } from '@testing-library/react';
import App from './App';

// test('renders learn react link', () => {
//   const { getByText } = render(<App />);
//   const linkElement = getByText(/learn react/i);
//   expect(linkElement).toBeInTheDocument();
// });
test('should render without crashing', () => {
  render(<App />);
});

//OMAT SAVUTESTIT:

test('Logo löytyy', () => {
  render(<App/>)
  screen.getByAltText('logo')
})

test('Valikkorivi löytyy', () => {
  render(<App/>)
  expect(screen.getByText("Projects"))
})

test('Projektit löytyy', async() => {
  render(<App/>)
  fireEvent.click(screen.getByText("Projects"))
  await waitFor(() => screen.getByText("More..."))
  expect(screen.getByText("More..."))
})
