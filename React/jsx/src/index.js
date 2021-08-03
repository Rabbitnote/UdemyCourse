//Import The React and ReactDOM libraries
import React from 'react';
import ReactDOM from 'react-dom';
import './App.scss';

//Create a react component
const App = () => {
    const buttonText ={text:'Click Me!'};
    return (
        <div className='container'>
            <div className='container__text u-mg-bt'>Text</div>
            <div className="container__detail">
            <label className='container__label'>Enter Name: </label>
            <input className='container__input'></input>
            <button className='container__btn'>{buttonText.text}</button>
            </div>
        </div>
    );
};
//Take the react component and show it on the screen
ReactDOM.render(<App />, document.querySelector('#root'));

