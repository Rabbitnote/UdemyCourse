import React, { useState } from 'react';
import '../styles/Accordion.scss';

const Accordion = ({ items }) => {
    const [activeIndex, setActiveIndex] = useState('');
    const [check, setCheck] = useState(false);
    const onTitleClick = index => {
        setActiveIndex(index);
        setCheck(!check);
    };
    const renderItems = items.map((item, index) => {
        const active =
            index === activeIndex ? check ? 'active':'title' : 'title';
       
        return (
            <React.Fragment key={item.title}>
                <div className='container'>
                    <div
                        className='container_header'
                        onClick={() => onTitleClick(index)}
                    >
                        <i className='fa fa-angle-down icon'></i>
                        <span className='head'>{item.title}</span>
                    </div>
                    <div className='container_content'>
                        <p className={active}>{item.content}</p>
                    </div>
                </div>
            </React.Fragment>
        );
    });
    return <div>{renderItems}</div>;
};
export default Accordion;
