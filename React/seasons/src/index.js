import React from 'react';
import ReactDOM from 'react-dom';
import SeasonDisplay from './SeasonDisplay';

class App extends React.Component {
    //Going to run first
    constructor(props) {
        super(props);
        this.state = { lat: null, errorMessage: '' };
    }
    componentDidMount() {
        window.navigator.geolocation.getCurrentPosition(
            position => this.setState({ lat: position.coords.latitude }),
            err => this.setState({ errorMessage: err.message })
        );
    }
    // componentDidMount(){
    //     console.log('My component wßas rendered to the screen');
    // }
    // componentDidUpdate(){
    //     console.log('My component was updated');
    // }
    //React syas we have to definße render
    render() {
        if (this.state.errorMessage && !this.state.lat) {
            return <div>Error : {this.state.errorMessage}</div>;
        }
        if (!this.state.errorMessage && this.state.lat) {
            return <div>Lattitude : {this.state.lat}</div>;
        }
        if (!this.state.errorMessage && !this.state.lat) {
            return <div>Loading !</div>;
        }
    }
}
ReactDOM.render(<App />, document.querySelector('#root'));
