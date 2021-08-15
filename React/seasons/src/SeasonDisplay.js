import React from 'react';
import logoSnow from './img/snowflake.png';
import logoSun from './img/sun.png';
import beach from './img/beach.jpeg';
import snow from './img/snow.jpeg';
import './App.scss';

const seasonConfig = {
    summer: {
        text: "Let's hit the beach!",
        logo: logoSun,
        background: beach
    },
    winter: {
        text: 'Burr it is cold!!!',
        logo: logoSnow,
        background: snow
    }
};
const getSeason = (lat, month) => {
    if (month > 2 && month < 9) {
        return lat > 0 ? 'summer' : 'winter';
    } else {
        return lat > 0 ? 'winter' : 'summer';
    }
};

const SeasonDisplay = props => {
    const season = getSeason(props.lat, new Date().getMonth());
    const { text, logo, background } = seasonConfig[season];
    return (
        <div>
            <img src={background} alt='' className='background' />
            <div className='seasondisplay'>
                {season === 'winter' ? (
                    <img src={logo} alt='' className='seasondisplay__icon' />
                ) : (
                    <img src={logo} alt='' className='seasondisplay__icon' />
                )}
                {season==='winter'?<h1 className='seasondisplay__text winter'>{text}</h1>:<h1 className='seasondisplay__text summer'>{text}</h1>}
                {season === 'winter' ? (
                    <img src={logo} alt='' className='seasondisplay__icon' />
                ) : (
                    <img src={logo} alt='' className='seasondisplay__icon' />
                )}
            </div>
        </div>
    );
};
export default SeasonDisplay;
