import React from 'react';
import ReactDOM from 'react-dom';
import CommentDetail from './CommentDetail';
import faker from 'faker';
import ApprovalCard from './ApprovalCard';

const App = () => {
    return (
        <div>
            <ApprovalCard>
            <CommentDetail author="Sam" time="Today at 4:45PM" img={faker.image.avatar()} comment="Nice!"/>
            </ApprovalCard>
            <ApprovalCard>
            <CommentDetail author="Note" time="Today at 2:45PM" img={faker.image.avatar()} comment="Nice Blog!"/>\
            </ApprovalCard>
            <ApprovalCard>
            <CommentDetail author="Max" time="Yesterday at 5:00PM " img={faker.image.avatar()} comment="Hello!"/>
            </ApprovalCard>
        </div>
    );
};

ReactDOM.render(<App />, document.querySelector('#root'));
