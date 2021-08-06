import React from 'react';
import './Comment.scss';


const CommentDetail = (props) => {
    return (
        <div className='container'>
            <img src={props.img} alt='Avatar' className='avatar' />
            <div>
                <div className='content u-mg-bt'>
                    <a href='/' className='content__author'>
                        {props.author}
                    </a>

                        <span className='content__date'>{props.time}</span>

                </div>
                <div className='text'>{props.comment}</div>
            </div>
        </div>
    );
};
export default CommentDetail;
