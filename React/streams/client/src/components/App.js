import React from 'react';
import { BrowserRouter, Route,Link } from 'react-router-dom';

const PageOne = () => {
    return (
        <div>
            PageOne
            <Link to='/pagetwo'>Navigate to page two</Link>
        </div>
    );
};

const PageTwo = () => {
    return (
        <div>
            PagTwo
            <Link to='/'>Navigate to page one</Link>
        </div>
    );
};

const App = () => {
    return (
        <div>
            <BrowserRouter>
                <div>
                    <Route path='/' exact component={PageOne}></Route>
                    <Route path='/pagetwo' exact component={PageTwo}></Route>
                </div>
            </BrowserRouter>
        </div>
    );
};
export default App;
