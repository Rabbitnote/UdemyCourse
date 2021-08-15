import React from 'react';
import SearchBar from './SearchBar';
import unsplash from '../api/unsplash';
import ImageList from './imageList';
import '../App.scss';

class App extends React.Component {
    state = { images: [] };
    onSearchSubmit = async term => {
        const response = await unsplash.get('/search/photos', {
            params: {
                query: term
            }
        });
        this.setState({ images: response.data.results });
    };
    render() {
        return (
            <div>
                <SearchBar onSubmit={this.onSearchSubmit} />
                <div >
                    <ImageList images={this.state.images} />
                </div>
            </div>
        );
    }
}
export default App;
