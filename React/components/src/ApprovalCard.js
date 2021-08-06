import React from 'react';
import './Comment.scss';

const ApprovalCard = (props) => {
    return (
        <div className="maincontainer">
            <div className='content'>{props.children}</div>
            <div className='btn'>
                <button className='btn__approval'>Approve</button>
                <button className='btn__reject'>Reject</button>
            </div>
        </div>
    );
};
export default ApprovalCard;
