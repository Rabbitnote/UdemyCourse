import React, { useState, useEffect } from 'react';
import '../styles/Search.scss';
import axios from 'axios';

const Search = () => {
    const [term, setTerm] = useState('');
    const [results, setResults] = useState([]);
    console.log(results);
    useEffect(() => {
        const searchTerm = async () => {
            const { data } = await axios.get(
                'https://en.wikipedia.org/w/api.php',
                {
                    params: {
                        action: 'query',
                        list: 'search',
                        origin: '*',
                        format: 'json',
                        srsearch: term
                    }
                }
            );
            setResults(data.query.search);
        };
        if (term && !results.length) {
            searchTerm();
        } else {
            const timeoutId = setTimeout(() => {
                if (term) {
                    searchTerm();
                }
            }, 1000);
            return () => {
                clearTimeout(timeoutId);
            };
        }

        //(async () => {
        //    await axios.get('');
        //})();
    }, [term]);
    const renderResults = results.map(results => {
        return (
            <div key={results.pageid} className='results'>
                <div className='results__header'>
                    {results.title}
                    <a
                        className='results__link'
                        href={`https://en.wikipedia.org?curid=${results.pageid}`}
                    >
                        Go
                    </a>
                </div>
                <div className='results__content'>
                    <span
                        dangerouslySetInnerHTML={{ __html: results.snippet }}
                    ></span>
                </div>
            </div>
        );
    });
    return (
        <div>
            <div className='container'>
                <div className='container__content'>
                    <h1 className='container__label'>Enter Search Term</h1>
                    <input
                        value={term}
                        onChange={e => setTerm(e.target.value)}
                        type='text'
                        className='container__input'
                    />
                </div>
            </div>
            <div>{renderResults}</div>
        </div>
    );
};
export default Search;
