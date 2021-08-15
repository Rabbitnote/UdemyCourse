import React from 'react';
import ReactDOM from 'react-dom';
import SeasonDisplay from './SeasonDisplay';
import Loading from './Loading';

class App extends React.Component {
    //Going to run first
    // constructor(props) {
    //     super(props);
    //     this.state = { lat: null, errorMessage: '' };
    // }

    state = { lat: null, errorMessage: '' };
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
    renderContent() {
        if (this.state.errorMessage && !this.state.lat) {
            return <div>Error : {this.state.errorMessage}</div>;
        }
        if (!this.state.errorMessage && this.state.lat) {
            return <SeasonDisplay lat={this.state.lat}></SeasonDisplay>;
        }
        if (!this.state.errorMessage && !this.state.lat) {
            return (
                <Loading message='Please Accept loaction request!!'></Loading>
            );
        }
    }
    //React syas we have to definße render
    render() {
        return <div>{this.renderContent()}</div>;
    }
}
ReactDOM.render(<App />, document.querySelector('#root'));
