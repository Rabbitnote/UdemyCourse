import { combineReducers } from 'redux';
const songReducer = () => {
    return [
        { title: 'Maroon 5', duration: '4.05' },
        { title: 'Charile', duration: '2.05' },
        { title: 'Avicii', duration: '3.35' }
    ];
};

const selectedSongReducer = (selectedSong = null, action) => {
    if (action.type === 'SONG_SELECTED') {
        return action.payload;
    }
    return selectedSong;
};

export default combineReducers({
    songs: songReducer,
    selectedSong: selectedSongReducer
});
