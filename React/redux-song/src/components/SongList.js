import React, { Component } from 'react';
import { connect } from 'react-redux';
import { selectSong } from '../actions';

class SongList extends Component {
    renderList() {
        return this.props.song.map(song => {
            return (
                <div
                    style={{
                        display: 'flex',
                        width: '300px',
                        justifyContent: 'space-evenly',
                        margin: '2rem',
                        alignItems: 'center',
                        borderBottom: '2px solid lightgrey',
                        paddingBottom: '0.5rem'
                    }}
                    key={song.title}
                >
                    <div style={{ width: '250px' }}>{song.title}</div>
                    <button
                        style={{
                            border: 'none',
                            padding: '0.5rem 1rem',
                            backgroundColor: '#2565AE',
                            color: '#fff',
                            borderRadius: '5px',
                            cursor:'pointer'
                        }}
                        onClick={() => this.props.selectSong(song)}
                    >
                        detail
                    </button>
                </div>
            );
        });
    }
    render() {
        return <div>{this.renderList()}</div>;
    }
}

const mapStateToProps = state => {
    return { song: state.songs };
};

export default connect(mapStateToProps, { selectSong })(SongList);
