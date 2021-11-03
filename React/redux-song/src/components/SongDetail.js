import React from 'react';
import { connect } from 'react-redux';

const SongDetail = ({ chooseSong }) => {
    if (!chooseSong) {
        return <div> Selected Song!</div>;
    }
    return (
        <div style={{ width: '400px' }}>
            <h1>Detail of the song</h1>
            <h2>Name :{chooseSong.title}</h2>
            <p> <span style={{fontWeight:'bold'}}>Durtation</span> :{chooseSong.duration}</p>
        </div>
    );
};

const mapStateToProps = state => {
    return { chooseSong: state.selectedSong };
};

export default connect(mapStateToProps)(SongDetail);
