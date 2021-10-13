import React, { useState, useEffect } from 'react';
import axios from 'axios';

const Convert = ({ language, text }) => {
    const [translate, setTranslated] = useState('');
    const [debounced, setDebouncedText] = useState(text);
    useEffect(() => {
        const timerId = setTimeout(() => setDebouncedText(text), 500);
        return () => {
            clearTimeout(timerId);
        };
    }, [text]);
    useEffect(() => {
        const doTranslation = async () => {
            const { data } = await axios.post(
                'https://translation.googleapis.com/language/translate/v2',
                {},
                {
                    params: {
                        q: debounced,
                        target: language.value,
                        key: 'AIzaSyCHUCmpR7cT_yDFHC98CZJy2LTms - IwDlM'
                    }
                }
            );
            setTranslated(data.data.translations[0].translatedText);
        };
        doTranslation();
    }, [language, debounced]);
    return (
        <div>
            <h1>{translate}</h1>
        </div>
    );
};
export default Convert;
