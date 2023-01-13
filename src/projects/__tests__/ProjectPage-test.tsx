//OMAT TESTIT:

import { Provider } from 'react-redux';
import { MemoryRouter } from 'react-router-dom';
import { render, screen } from '@testing-library/react';
import { store } from '../../state';
import ProjectPage from '../ProjectPage';

describe('<ProjectPage />', () => {
    const setup = () =>
      render(
        <Provider store={store}>
          <MemoryRouter>
            <ProjectPage />
          </MemoryRouter>
        </Provider>
      );
  
    beforeEach(() => {});

  

test('sivu latautuu', () => {
    setup();
    expect(screen).toBeDefined();
});

test('Project Detail löytyy', () => {
    setup();
    expect(screen.getByRole('heading', {name:'Project Detail'}));
});


});