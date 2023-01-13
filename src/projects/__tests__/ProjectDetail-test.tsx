//OMAT TESTIT:

import { Provider } from 'react-redux';
import { MemoryRouter } from 'react-router-dom';
import ProjectDetail from '../ProjectDetail';
import { render, screen } from '@testing-library/react';
import { MOCK_PROJECTS } from '../MockProjects';
import { store } from '../../state';

describe('<ProjectList />', () => {
    const setup = () =>
      render(
        <Provider store={store}>
          <MemoryRouter>
            <ProjectDetail project={MOCK_PROJECTS[0]} />
          </MemoryRouter>
        </Provider>
      );
  
    beforeEach(() => {});

  

test('sivu latautuu', () => {
    setup();
    expect(screen).toBeDefined();
});

test('tiedot löytyy', () => {
    setup();
    expect(screen.getByRole('img', {name: /Johnson - Kutch/}));
    expect(screen.getByRole('heading', {name: /Johnson - Kutch/}));
    expect(screen.getByText(/Fully-configurable intermediate framework. Ullam occaecati libero laudantium nihil voluptas omnis/));
})


});