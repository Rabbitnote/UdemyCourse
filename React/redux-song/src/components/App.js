import React from 'react';
import SongList from './SongList';
import SongDetail from './SongDetail';

const App = () => {
    return (
        <div style={{ width: '100vw', display: 'flex' }}>
            <SongList />
            <SongDetail />
        </div>
    );
};
export default App;
