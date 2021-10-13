import React, { useState } from 'react';
import Accordion from './components/Accordion';
import Search from './components/Search';
import Translate from './components/Translate';
import Dropdown from './components/Dropdown';
import Route from './components/Route';
import Navbar from './components/Navbar';

const items = [
    {
        title: 'What is React?',
        content: 'React is a front end javascript framework'
    },
    {
        title: 'Why use React?',
        content: 'React is a facorite JS libary among engineers'
    },
    {
        title: 'How do you use React?',
        content: 'You use React by creating components'
    }
];
const options = [
    { label: 'The Color Red', value: 'red' },
    { label: 'The Color Green', value: 'green' },
    { label: 'The Color Blue', value: 'blue' }
];

export default () => {
    const [selected, setSelected] = useState(options[0]);
    return (
        <div>
            <Navbar/>
            <Route path='/'>
                <Accordion items={items} />
            </Route>
            <Route path='/list'>
                <Search />
            </Route>
            <Route path='/dropdown'>
                <Dropdown
                    label='Select a Color'
                    options={options}
                    selected={selected}
                    onSelectedChange={setSelected}
                />
            </Route>
            <Route path='/translate'>
                <Translate />
            </Route>
        </div>
    );
};
