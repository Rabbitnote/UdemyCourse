import React from 'react';
import '../App.scss';

class SearchBar extends React.Component {
    state = { term: '' };

    onFormSubmit = event => {
        event.preventDefault();
        this.props.onSubmit(this.state.term);
    };
    render() {
        return (
            <div className='searchbar'>
                <form className='searchbar__form' onSubmit={this.onFormSubmit}>
                    <div className='searchbar__text'>Image Search</div>
                    <input
                        type='text'
                        className='searchbar__input'
                        value={this.state.term}
                        onChange={e =>
                            this.setState({
                                term: e.target.value
                            })
                        }
                    />
                </form>
            </div>
        );
    }
}
export default SearchBar;
