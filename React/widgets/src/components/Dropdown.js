import React, { useState, useEffect, useRef } from 'react';
import '../styles/Dropdown.scss';
const Dropdown = ({ options, selected, onSelectedChange,label }) => {
    const [dropdownCheck, setDropdownCheck] = useState(false);
    const ref = useRef();
    useEffect(() => {
        const onBodyClick = event => {
            if (ref.current.contains(event.target)) {
                return;
            }
            setDropdownCheck(false);
        };
        document.body.addEventListener('click', onBodyClick, { capture: true });
        return () => {
            document.body.removeEventListener('click', onBodyClick, {
                capture: true
            });
        };
    }, []);
    const dropdownActive = dropdownCheck ? (
        <span>&#9665;</span>
    ) : (
        <span>&#9661;</span>
    );

    const renderOptions = options.map(option => {
        if (option.value === selected.value) {
            return null;
        }
        const clickItem = () => {
            onSelectedChange(option);
            setDropdownCheck(!dropdownCheck);
        };
        return (
            <div
                key={option.value}
                className={`dropdown_item ${dropdownCheck ? '' : ' hideItem'}`}
                onClick={clickItem}
            >
                {option.label}
            </div>
        );
    });
    return (
        <div ref={ref} className='dropdown'>
            <label className='dropdown_label'>{label}</label>
            <div
                className={`dropdown_text ${dropdownCheck ? '' : 'showItem'}`}
                onClick={() => setDropdownCheck(!dropdownCheck)}
            >
                <span>{selected.label}</span> <span> {dropdownActive}</span>
            </div>

            {renderOptions}
        </div>
    );
};
export default Dropdown;
