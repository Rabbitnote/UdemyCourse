//AIzaSyCHUCmpR7cT_yDFHC98CZJy2LTms-IwDlM
import React, { useState } from 'react';
import Dropwdown from './Dropdown';
import '../styles/Translate.scss';
import Convert from './Convert';

const options = [
    { label: 'Afrikaans', value: 'af' },
    { label: 'Afabic', value: 'ar' },
    { label: 'Hindi', value: 'hi' }
];

const Translate = () => {
    const [lanuage, setLanguage] = useState(options[0]);
    const [text, setText] = useState('');
    return (
        <div>
            <h1>Enter Text</h1>
            <input value={text} onChange={e => setText(e.target.value)} />
            <Dropwdown
                label='Select a language'
                selected={lanuage}
                onSelectedChange={setLanguage}
                options={options}
            />
            <hr />
            <h3>Output</h3>
            <Convert text={text} language={lanuage}/>
        </div>
    );
};
export default Translate;
